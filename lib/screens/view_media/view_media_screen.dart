import 'package:flutter/material.dart';
import 'package:myapp/models/media_list.dart';

class ViewMediaScreen extends StatefulWidget {
  const ViewMediaScreen({super.key});

  @override
  State<ViewMediaScreen> createState() => _ViewMediaScreenState();
}

class _ViewMediaScreenState extends State<ViewMediaScreen> {
  final List<MediaList> medias = [
    MediaList(
      namaFile: 'Video Survey Garut - Bandung',
      status: true,
      lat: -1.234,
      long: 1.312,
    ),
    MediaList(
      namaFile: 'Video Survey Garut - Las Vegas',
      status: true,
      lat: -1.234,
      long: 1.312,
    ),
    MediaList(
      namaFile: 'Video Survey Garut - NYC',
      status: false,
      lat: -1.234,
      long: 1.312,
    ),
    MediaList(
      namaFile: 'Video Survey Garut - Jayaraga',
      status: true,
      lat: -1.234,
      long: 1.312,
    ),
    MediaList(
      namaFile: 'Video Survey Garut - Paris',
      status: false,
      lat: -1.234,
      long: 1.312,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          // Judul dengan padding
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'View Media',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // List Media File Survey
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ListView.builder(
                itemCount: medias.length,
                itemBuilder: (context, index) {
                  final media = medias[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 10, // Mengecilkan ukuran avatar
                        backgroundColor:
                            media.status ? Colors.green : Colors.red,
                        child: Icon(
                          media.status ? Icons.check : Icons.upload,
                          color: Colors.white,
                          size: 12, // Mengecilkan ukuran ikon
                        ),
                      ),
                      title: Text(
                        media.namaFile,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            Text(
                              'Lat: ${media.lat}',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[600]),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Long: ${media.long}',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        // Menampilkan dialog saat item ditekan
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Detail dari ${media.namaFile}',
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                'Latitude: ${media.lat}    Longitude: ${media.long}\nStatus: ${media.status ? "Uploaded" : "Not Uploaded"}',
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
