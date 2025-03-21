import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:location/location.dart';
// import 'package:wifi_iot/wifi_iot.dart';

class ServiceChecker {
  // Cek Bluetooth
  Future<bool> isBluetoothOn() async {
    BluetoothAdapterState state = await FlutterBluePlus.adapterState.first;
    return state == BluetoothAdapterState.on;
  }

  // Cek Location
  Future<bool> isLocationOn() async {
    Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }
}