import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/customize_screen.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/initial_screen.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
        ),
        home: const CustomizeScreen());
  }
}
