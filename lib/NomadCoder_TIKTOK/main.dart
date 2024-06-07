import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/authentication/signup_screen.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/onboarding/interests_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TikTok',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 16 + 2.0,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
        ),
        home: const InterestScreen());
  }
}
