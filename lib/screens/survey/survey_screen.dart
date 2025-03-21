// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/screens/bottom_navbar_config.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  String? selectedKota;
  String? selectedRute;
  String? selectedGopro;

  final List<String> itemKota = [
    'Garut',
    'Bandung',
    'Las Vegas',
    'Tokyo',
  ];

  final List<String> itemRute = [
    'Garut - Bandung',
    'Garut - Las Vegas',
    'Garut - New York',
    'Garut - Paris',
  ];

  final List<String> itemGopro = [
    'GoPro Basic',
    'GoPro Expert',
    'GoPro Fernu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'MASUKAN',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              const Text(
                "RUTE SURVEY",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              const SizedBox(height: 50),

              // Dropdown untuk Kota
              SizedBox(
                width: 350, // Mengatur lebar dropdown
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Kota',
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black87),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  value: selectedKota,
                  items: itemKota.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedKota = newValue; // Update nilai kota
                    });
                  },
                  dropdownColor: Colors.white, // Warna dropdown
                  isExpanded:
                      true, // Membuat dropdown mengisi lebar yang tersedia
                ),
              ),

              const SizedBox(height: 20),

              // Dropdown untuk Rute
              SizedBox(
                width: 350, // Mengatur lebar dropdown
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Rute',
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black87),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  value: selectedRute,
                  items: itemRute.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRute = newValue; // Update nilai rute
                    });
                  },
                  dropdownColor: Colors.white, // Warna dropdown
                  isExpanded:
                      true, // Membuat dropdown mengisi lebar yang tersedia
                ),
              ),

              const SizedBox(height: 20),

              // Dropdown untuk GoPro
              SizedBox(
                width: 350, // Mengatur lebar dropdown
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'GoPro',
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black87),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  value: selectedGopro,
                  items: itemGopro.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGopro = newValue; // Update nilai GoPro
                    });
                  },
                  dropdownColor: Colors.white, // Warna dropdown
                  isExpanded:
                      true, // Membuat dropdown mengisi lebar yang tersedia
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavbarConfig(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Masukan Rute',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
