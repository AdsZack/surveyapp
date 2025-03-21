import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:myapp/models/data_riwayat.dart';
import 'package:myapp/screens/dashboard/mulai_survey/mulai_survey.dart';
import 'package:myapp/screens/dashboard/mulai_survey/service_checker.dart';

class ServiceDeviceValidation extends StatefulWidget {
  final DataRiwayat riwayat;

  const ServiceDeviceValidation({super.key, required this.riwayat});

  @override
  State<ServiceDeviceValidation> createState() =>
      _ServiceDeviceValidationState();
}

class _ServiceDeviceValidationState extends State<ServiceDeviceValidation> {
  final ServiceChecker _serviceChecker = ServiceChecker();
  final RefreshController _refreshController = RefreshController();

  bool isBluetoothOn = false;
  bool isLocationOn = false;

  @override
  void initState() {
    super.initState();
    _checkAllServices();
  }

  Future<void> _checkAllServices() async {
    bool bluetoothStatus = await _serviceChecker.isBluetoothOn();
    bool locationStatus = await _serviceChecker.isLocationOn();

    setState(() {
      isBluetoothOn = bluetoothStatus;
      isLocationOn = locationStatus;
    });
  }

  Future<void> _refreshServices() async {
    await _checkAllServices();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: _refreshServices,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              const SizedBox(height: 50),
              const Text(
                'Validasi \nService Device',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildServiceStatus(
                'Bluetooth',
                isBluetoothOn,
                Icons.bluetooth,
                Icons.bluetooth_disabled,
                AppSettingsType.bluetooth,
              ),
              _buildServiceStatus(
                'Lokasi',
                isLocationOn,
                Icons.location_on,
                Icons.location_off,
                AppSettingsType.location,
              ),
              const SizedBox(height: 30),
              if (isBluetoothOn && isLocationOn)
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 130, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MulaiSurvey(riwayat: widget.riwayat),
                        ),
                      );
                    },
                    child: const Text(
                      'Mulai Survey',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceStatus(String serviceName, bool status, IconData iconOn,
      IconData iconOff, AppSettingsType settingsType) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          status ? iconOn : iconOff,
          color: status ? Colors.black87 : Colors.grey,
          size: 32,
        ),
        title: Text(serviceName),
        subtitle: Text(
          status ? '$serviceName aktif' : '$serviceName tidak aktif',
          style: TextStyle(
            color: status ? Colors.black87 : Colors.grey,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: status ? Colors.grey : Colors.black87,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: status
              ? null
              : () => AppSettings.openAppSettings(type: settingsType),
          child: Text(status ? 'Aktif' : 'Aktifkan'),
        ),
      ),
    );
  }
}
