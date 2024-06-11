import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';

class ThreadLogo extends StatelessWidget {
  const ThreadLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 42,
        height: 48,
        child: Image.network(
            'https://freelogopng.com/images/all_img/1688663386threads-logo-transparent.png',
            fit: BoxFit.fill));
  }
}
