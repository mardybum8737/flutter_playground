import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final bool isWhite;
  final String text;
  final Widget icon;
  final void Function() onTap;

  const AuthButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isWhite,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16, horizontal: Sizes.size20),
          decoration: BoxDecoration(
            color: isWhite ? Colors.white : Colors.black,
            border: Border.all(
              color: Colors.grey.shade300,
              width: isWhite ? Sizes.size1 : 0,
            ),
            borderRadius: BorderRadius.circular(Sizes.size40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Gaps.h14,
              Text(
                text,
                style: TextStyle(
                  color: isWhite ? Colors.black : Colors.white,
                  fontSize: Sizes.size18,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.h10,
            ],
          ),
        ),
      ),
    );
  }
}
