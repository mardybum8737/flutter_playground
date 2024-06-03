import 'package:flutter/material.dart';
import 'package:flutter_playground/A10/screens/home_sceen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());
}

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
            fontSize: 28,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          titleMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          bodyMedium: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w400,
            height: 1.8,
            fontSize: 16,
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
          ),
          bodySmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          titleSmall: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: const Color.fromARGB(255, 255, 92, 81),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
