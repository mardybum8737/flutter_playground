import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';

class ActButton extends StatelessWidget {
  final Color color;
  final String text;
  final Widget icon;
  final bool isActivated;
  final void Function() onTap;

  const ActButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.icon,
    required this.isActivated,
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
            color: isActivated ? color : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(Sizes.size40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Gaps.h14,
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
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
