import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white, // Set background color of navbar
      selectedItemColor: Colors.black87, // Color for the selected item
      unselectedItemColor: Colors.grey, // Color for unselected items
      selectedFontSize: 14, // Font size for selected item label
      unselectedFontSize: 12, // Font size for unselected item label
      iconSize: 28, // Icon size
      elevation: 10, // Elevation for shadow effect
      type: BottomNavigationBarType.fixed, // Keeps items fixed in place

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_road),
          label: 'Survey',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.source),
          label: 'View Media',
        ),
      ],
    );
  }
}
