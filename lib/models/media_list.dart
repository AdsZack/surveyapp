class MediaList {
  final String namaFile;
  final bool status;
  final double lat;
  final double long;

  MediaList({
    required this.namaFile,
    required this.status,
    required this.lat,
    required this.long,
  });

  factory MediaList.fromJson(Map<String, dynamic> json) {
    return MediaList(
      namaFile: json['namaFile'],
      status: json['status'],
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namaFile': namaFile,
      'status': status,
      'lat': lat,
      'long': long,
    };
  }
}
