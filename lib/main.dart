import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:last_year_project/screens/LandingPage.dart';
import 'package:last_year_project/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Last Year Project',
      theme: ThemeData(
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat"),
      home: const LandingPage(),
    );
  }
}
