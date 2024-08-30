import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.selectedIndex,
  });

  final bool isSelected;
  final Function()? onTap;
  final IconData icon;
  final String title;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: selectedIndex == 0 ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 160),
            opacity: isSelected ? 1 : 0.5,
            child: Column(children: [
              FaIcon(
                icon,
                color: selectedIndex == 0 ? Colors.white : Colors.black,
                size: isSelected ? 24 : 20,
              ),
              Gaps.v6,
              Text(
                title,
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
