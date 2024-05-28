import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHour extends StatelessWidget {
  final int hour;

  const CardHour({required this.hour, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      hour.toString(),
      style: GoogleFonts.archivo(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 24,
            height: 1),
      ),
    );
  }
}
