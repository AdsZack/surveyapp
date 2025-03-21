import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard/mulai_survey/service_device_validation.dart';
import '../../models/data_riwayat.dart';
// import '../../widgets/status_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final int itemsPerPage = 3; // Jumlah data per halaman
  // int currentPage = 0; // Halaman saat ini

  // // Menghitung total halaman
  // int get totalPages => (dataList.length / itemsPerPage).ceil();

  // // Mengambil data berdasarkan halaman
  // List<DataRiwayat> getPaginatedData() {
  //   final startIndex = currentPage * itemsPerPage;
  //   final endIndex = (startIndex + itemsPerPage)
  //       .clamp(0, dataList.length); // Hindari overflow
  //   return dataList.sublist(startIndex, endIndex);
  // }

  // // Method untuk mendapatkan warna berdasarkan status
  // Color getStatusColor(String status) {
  //   switch (status) {
  //     case 'selesai':
  //       return Colors.green; // Hijau untuk selesai
  //     case 'belum-selesai':
  //       return Colors.red; // Merah untuk belum selesai
  //     default:
  //       return Colors.black; // Default warna
  //   }
  // }

  final List<DataRiwayat> _dataRiwayat = [
    DataRiwayat(rute: 'Garut - Bandung', status: 'not surveyed'),
    DataRiwayat(rute: 'Garut - Jayaraga', status: 'not surveyed'),
    DataRiwayat(rute: 'Garut - NYC', status: 'surveyed'),
    DataRiwayat(rute: 'Garut - Las Vegas', status: 'surveyed'),
    DataRiwayat(rute: 'Garut - Paris', status: 'not surveyed'),
  ];

  void navigateToMulaiSurvey(DataRiwayat riwayat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDeviceValidation(riwayat: riwayat),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile_image.jpg'),
                ),
                title: Text(
                  'Username',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  'Company name',
                  style: TextStyle(color: Colors.white60),
                ),
                // onTap: () {
                //   AlertDialog(
                //     actions: [],
                //   );
                // },
                trailing: Icon(
                  Icons.settings,
                  color: Colors.white60,
                ),
                tileColor: Colors.black87,
              ),
            ),
          ),
          // Container(
          //   width: 80, // Lebar dan tinggi harus sama
          //   height: 80, // Sesuaikan ukurannya
          //   decoration: BoxDecoration(
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.2),
          //         blurRadius: 8,
          //         offset: const Offset(0, 4),
          //       ),
          //     ],
          //     shape: BoxShape.circle, // Bentuk lingkaran
          //     border: Border.all(
          //         color: Colors.black, width: 1.5), // Border lingkaran
          //   ),
          //   child: ClipOval(
          //     child: Image.asset(
          //       'assets/images/logoLogin.jpeg',
          //       fit:
          //           BoxFit.cover, // Menyesuaikan gambar agar memenuhi lingkaran
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20),
          // const Text(
          //   'Selamat Datang User!',
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ListView.builder(
                itemCount: _dataRiwayat.length,
                itemBuilder: (context, index) {
                  final riwayat = _dataRiwayat[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      title: Text(
                        riwayat.rute,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Status: ${riwayat.status}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: riwayat.status == 'not surveyed'
                            ? () {
                                navigateToMulaiSurvey(riwayat);
                              }
                            : null, // Nonaktifkan tombol jika status bukan "not surveyed"
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(40, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Sudut lembut
                          ),
                          backgroundColor: riwayat.status == 'not surveyed'
                              ? Colors.black87
                              : Colors
                                  .grey, // Warna tombol disesuaikan dengan status
                        ),
                        child: const Text(
                          'Mulai',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
