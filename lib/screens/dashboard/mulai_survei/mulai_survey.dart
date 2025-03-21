import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:myapp/models/data_riwayat.dart';
import 'package:myapp/screens/bottom_navbar_config.dart';
import 'package:myapp/screens/dashboard/mulai_survey/controller/bluetooth_controller.dart';

class MulaiSurvey extends StatefulWidget {
  final DataRiwayat riwayat;
  const MulaiSurvey({super.key, required this.riwayat});

  @override
  State<MulaiSurvey> createState() => _MulaiSurveyState();
}

class _MulaiSurveyState extends State<MulaiSurvey> {
  late final DataRiwayat riwayat;
  final BluetoothController _bluetoothController = BluetoothController();
  BluetoothDevice? connectedDevice;
  int countdownTime = 10;
  int initialTime = 1;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    riwayat = widget.riwayat;
  }

  void _startRecording() async {
    final device = connectedDevice;
    if (device != null) {
      try {
        await _bluetoothController.startRecord(device);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Rekaman dimulai')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal memulai rekaman: $e')),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('GoPro belum terhubung')),
        );
      }
    }
  }

  void stopRecording() async {
    final device = connectedDevice;
    if (device != null) {
      try {
        await _bluetoothController.stopRecord(device);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Rekaman dihentikan')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal menghentikan rekaman: $e')),
          );
        }
      }
    }
    // else {
    //   if (mounted) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('GoPro belum terhubung')),
    //     );
    //   }
    // }
  }

  void startCountdown(int durationInMinutes) {
    setState(() {
      countdownTime = durationInMinutes * 60;
      initialTime = countdownTime;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdownTime--;
        if (countdownTime <= 0) {
          timer.cancel();
        }
      });
    });
  }

  void stopCountdown() {
    countdownTimer?.cancel();
    setState(() {
      countdownTime = 0;
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            // Inisialisasi nama jalan
            SizedBox(
                width: 300,
                child: Text(
                  riwayat.rute,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt, size: 50, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              color: Colors.black87,
              value: countdownTime > 0 && initialTime > 0
                  ? countdownTime / initialTime
                  : 0.0,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDurationButton(10),
                const SizedBox(width: 8),
                _buildDurationButton(15),
                const SizedBox(width: 8),
                _buildDurationButton(20),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _startRecording();
                    startCountdown(initialTime ~/ 60);
                  },
                  child: const Text(
                    'Start Recording',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    stopRecording();
                    stopCountdown();
                  },
                  child: const Text(
                    'Stop Recording',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavbarConfig(),
                  ),
                );
              },
              child: const Text(
                'Kembali ke Home',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationButton(int minutes) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        startCountdown(minutes);
      },
      child: Text(
        '$minutes Menit',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
