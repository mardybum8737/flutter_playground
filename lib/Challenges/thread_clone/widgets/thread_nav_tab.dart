import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadNavTab extends StatelessWidget {
  const ThreadNavTab({
    super.key,
    this.onTap,
    required this.icon,
    required this.isSelected,
  });

  final bool isSelected;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.white,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 160),
              opacity: isSelected ? 1 : 0.5,
              child: FaIcon(
                icon,
                color: Colors.black,
                size: Sizes.size24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
