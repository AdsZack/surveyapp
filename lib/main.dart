import 'package:flutter/material.dart';

import 'package:myapp/router.dart';
// import 'package:goproapp/screens/view_media/view_media_screen.dart';

void main() {
  runApp(const SurveyApp());
}

class SurveyApp extends StatelessWidget {
  const SurveyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GoPro App',
      initialRoute: '/', 
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      // home: MulaiSurvey(),
    );
  }
}
