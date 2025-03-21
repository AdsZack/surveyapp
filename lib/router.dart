import 'package:flutter/material.dart';
import 'package:myapp/screens/bottom_navbar_config.dart';
// import 'package:surveyapp_v0/screens/survey_screen.dart';

import 'screens/dashboard/dashboard_screen.dart';
import 'screens/login_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/bottomConfig':
        return MaterialPageRoute(builder: (_) => const BottomNavbarConfig());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('no route define for ${settings.name}'),
            ),
          ),
        );
    }
  }
}