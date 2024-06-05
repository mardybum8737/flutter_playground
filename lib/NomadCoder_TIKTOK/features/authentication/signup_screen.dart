import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/authentication/login_screen.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/authentication/username_screen.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void _onEmailButtonTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UserNameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                'Sign up for TikTok',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                'Create a profile, follow other accounts, make your own videos, and more!',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                onTap: () => _onEmailButtonTap(context),
                text: 'Use email & password',
                icon: const FaIcon(
                  FontAwesomeIcons.solidUser,
                ),
              ),
              Gaps.v16,
              AuthButton(
                onTap: () => {},
                text: 'Continue with Apple',
                icon: const FaIcon(
                  FontAwesomeIcons.apple,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
