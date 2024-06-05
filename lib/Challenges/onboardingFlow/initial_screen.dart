import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/widgets/auth_button.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/widgets/googlelogo.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/widgets/grey_bar.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.twitter,
            color: Colors.blue, size: 40),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Gaps.v120,
            const Text(
              'See what’s happening in the world right now.',
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v120,
            AuthButton(
                isWhite: true,
                text: 'Continue with Google',
                icon: const GoogleLogo(),
                onTap: () {}),
            Gaps.v14,
            AuthButton(
                isWhite: true,
                text: 'Continue with Apple',
                icon: const FaIcon(
                  FontAwesomeIcons.apple,
                  color: Colors.black,
                  size: 32,
                ),
                onTap: () {}),
            Gaps.v12,
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GreyBar(),
                Gaps.h10,
                Text('or'),
                Gaps.h10,
                GreyBar(),
              ],
            ),
            Gaps.v4,
            AuthButton(
                text: 'Create account',
                icon: const SizedBox(
                  width: 0,
                ),
                onTap: () {},
                isWhite: false),
          ]),
        ),
      ),
    );
  }
}
