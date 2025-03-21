import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard/dashboard_screen.dart';
import 'package:myapp/screens/view_media/view_media_screen.dart';
import 'package:myapp/screens/survey/survey_screen.dart'; // Import DashboardHome
import '../../widgets/bottom_navbar.dart';

class BottomNavbarConfig extends StatefulWidget {
  const BottomNavbarConfig({super.key});

  @override
  State<BottomNavbarConfig> createState() => _BottomNavbarConfigState();
}

class _BottomNavbarConfigState extends State<BottomNavbarConfig> {
  int _selectedIndex = 1;

  // Include DashboardHome as the first item in the screens list
  final List<Widget> _screens = [
    // Default home screen
    const SurveyScreen(),
    const DashboardScreen(),
    const ViewMediaScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
