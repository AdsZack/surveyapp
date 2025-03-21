import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ConnectModel{
  ConnectModel({
    this.device,
    this.record,
    this.bluetoothServices,
    this.connectWifi,
    this.ssid,
    this.timer,
  });

  BluetoothDevice? device;
  bool? record;
  List<BluetoothService>? bluetoothServices;
  bool? connectWifi;
  String? ssid;
  Timer? timer;
}

class ConnectHero3Model{
  ConnectHero3Model({
    this.device,
    this.record,
    this.connectWifi,
    this.ssid,
    // this.timer
  });

  String? device;
  bool? record;
  bool? connectWifi;
  String? ssid;
  // Timer? timer;
}