import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMin extends StatelessWidget {
  final int minute;

  const CardMin({required this.minute, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      minute.toString(),
      style: GoogleFonts.archivo(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 16,
            height: 1),
      ),
    );
  }
}
