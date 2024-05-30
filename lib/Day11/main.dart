import 'package:flutter/material.dart';
import 'package:flutter_playground/Day11/pomodoro.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardColor: const Color.fromARGB(255, 253, 218, 218),
        primaryColor: const Color.fromARGB(255, 255, 92, 81),
        primaryColorDark: const Color.fromARGB(255, 168, 75, 68),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 64,
            color: const Color.fromARGB(255, 255, 92, 81),
          ),
          titleMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 24,
            letterSpacing: 4,
            color: const Color.fromARGB(255, 253, 218, 218),
          ),
          bodyMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 24,
            letterSpacing: 4,
            color: const Color.fromARGB(255, 253, 218, 218).withOpacity(0.6),
          ),
          bodySmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 24,
            letterSpacing: 4,
            color: const Color.fromARGB(255, 255, 92, 81),
          ),
          titleSmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: const Color.fromARGB(255, 255, 92, 81),
          ),
        ),
      ),
      home: const Pomodoro(),
    );
  }
}

void main() {
  runApp(const App());
}
