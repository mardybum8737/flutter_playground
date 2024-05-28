import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalNum extends StatelessWidget {
  final int number;

  const CalNum({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Text(number.toString(),
        style: GoogleFonts.archivo(
          textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white24,
              fontSize: 44,
              height: 1),
        ));
  }
}
