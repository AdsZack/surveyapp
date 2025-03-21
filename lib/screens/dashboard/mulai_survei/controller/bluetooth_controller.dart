import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';

class BluetoothController {
  final Logger _logger = Logger();

  /// Format UUID 128-bit GoPro
  String formatGoProUuid(String shorthand) {
    return 'b5f9$shorthand-aa8d-11e3-9046-0002a5d5c51b';
  }

  /// Temukan Service berdasarkan UUID
  Future<BluetoothService?> findService(BluetoothDevice device, Guid serviceUuid) async {
    try {
      _logger.i("Mencari service UUID: $serviceUuid...");
      List<BluetoothService> services = await device.discoverServices();
      BluetoothService? targetService;
      try {
        targetService = services.firstWhere((service) => service.uuid == serviceUuid);
      } catch (_) {
        targetService = null;
      }

      if (targetService != null) {
        _logger.i("Service ditemukan: ${targetService.uuid}");
        return targetService;
      } else {
        _logger.w("Service UUID tidak ditemukan: $serviceUuid");
        return null;
      }
    } catch (e) {
      _logger.e("Gagal menemukan service: $e");
      return null;
    }
  }

  /// Temukan Characteristic berdasarkan UUID
  Future<BluetoothCharacteristic?> findCharacteristic(
      BluetoothService service, Guid characteristicUuid) async {
    try {
      _logger.i("Mencari characteristic UUID: $characteristicUuid...");
      BluetoothCharacteristic? targetCharacteristic;
      try {
        targetCharacteristic = service.characteristics
            .firstWhere((characteristic) => characteristic.uuid == characteristicUuid);
      } catch (_) {
        targetCharacteristic = null;
      }

      if (targetCharacteristic != null) {
        _logger.i("Characteristic ditemukan: ${targetCharacteristic.uuid}");
        return targetCharacteristic;
      } else {
        _logger.w("Characteristic UUID tidak ditemukan: $characteristicUuid");
        return null;
      }
    } catch (e) {
      _logger.e("Gagal menemukan characteristic: $e");
      return null;
    }
  }

  /// Menulis Data ke Characteristic
  Future<void> writeToCharacteristic(BluetoothDevice device, Guid serviceUuid,
      Guid characteristicUuid, List<int> value) async {
    try {
      final service = await findService(device, serviceUuid);
      if (service == null) {
        _logger.w("Service tidak ditemukan. Operasi dibatalkan.");
        return;
      }

      final characteristic = await findCharacteristic(service, characteristicUuid);
      if (characteristic == null) {
        _logger.w("Characteristic tidak ditemukan. Operasi dibatalkan.");
        return;
      }

      _logger.i("Menulis data ke characteristic...");
      await characteristic.write(value, withoutResponse: false);
      _logger.i("Data berhasil ditulis: $value");
    } catch (e) {
      _logger.e("Gagal menulis ke characteristic: $e");
    }
  }

  /// Memulai rekaman di GoPro
  Future<void> startRecord(BluetoothDevice device) async {
    final serviceUuid = Guid(formatGoProUuid('0072')); // UUID untuk Command
    final characteristicUuid = Guid(formatGoProUuid('0072'));
    final command = [0x01]; // Command untuk memulai rekaman

    await writeToCharacteristic(device, serviceUuid, characteristicUuid, command);
  }

  /// Menghentikan rekaman di GoPro
  Future<void> stopRecord(BluetoothDevice device) async {
    final serviceUuid = Guid(formatGoProUuid('0072')); // UUID untuk Command
    final characteristicUuid = Guid(formatGoProUuid('0072'));
    final command = [0x00]; // Command untuk menghentikan rekaman

    await writeToCharacteristic(device, serviceUuid, characteristicUuid, command);
  }
}
