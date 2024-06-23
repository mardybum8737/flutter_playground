import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavPostVideoButton extends StatelessWidget {
  const NavPostVideoButton({super.key, required this.inverted});

  final bool inverted;

  @override
  Widget build(context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 22,
          child: Container(
            height: 40,
            width: 25,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
          ),
        ),
        Positioned(
          left: 22,
          child: Container(
            height: 40,
            width: 25,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
          height: 40,
          decoration: BoxDecoration(
            color: inverted ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size8),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: inverted ? Colors.white : Colors.black,
              size: Sizes.size20,
            ),
          ),
        )
      ],
    );
  }
}
