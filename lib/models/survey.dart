class Survey {
  // String ruteAwal;
  // String ruteAkhir;
  final String kota;
  final String rute;
  final String device;

  Survey({required this.kota, required this.rute, required this.device});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      kota: json['kota'],
      rute: json['rute'],
      device: json['device'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kota': kota,
      'rute': rute,
      'device': device,
    };
  }
}
