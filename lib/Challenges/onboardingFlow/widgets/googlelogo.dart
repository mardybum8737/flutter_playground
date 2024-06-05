import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';

class GoogleLogo extends StatelessWidget {
  const GoogleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Sizes.size40,
        height: Sizes.size40,
        child: Image.network(
            'http://pngimg.com/uploads/google/google_PNG19635.png',
            fit: BoxFit.cover));
  }
}
