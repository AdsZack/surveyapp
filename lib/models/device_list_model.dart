class DeviceListModel {
  DeviceListModel({
    this.deviceId,
    this.deviceName,
    this.connect,
  });

  String? deviceId;
  String? deviceName;
  Future<void>? connect;
}
