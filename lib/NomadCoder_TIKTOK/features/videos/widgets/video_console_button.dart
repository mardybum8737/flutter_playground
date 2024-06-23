import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/constants/sizes.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoConsoleButton extends StatelessWidget {
  const VideoConsoleButton({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          color: Colors.white,
          size: Sizes.size40,
        ),
        Gaps.v6,
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
