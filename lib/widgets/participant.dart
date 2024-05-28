import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Participant extends StatelessWidget {
  final String name;

  const Participant({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name.toUpperCase(),
      style: GoogleFonts.archivo(
        textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: (name == 'me') ? Colors.black : Colors.black38,
            fontSize: 14,
            height: 1),
      ),
    );
  }
}
