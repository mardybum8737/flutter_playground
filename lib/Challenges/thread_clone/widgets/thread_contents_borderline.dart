import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';

class ThreadContentsBorderline extends StatelessWidget {
  const ThreadContentsBorderline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.v16,
        SizedBox(
          width: double.infinity,
          height: 1,
          child: Container(
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
