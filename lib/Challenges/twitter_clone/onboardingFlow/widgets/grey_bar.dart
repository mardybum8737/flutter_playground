import 'package:flutter/material.dart';

class GreyBar extends StatelessWidget {
  const GreyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.4,
        color: Colors.grey.shade300,
      ),
    );
  }
}
