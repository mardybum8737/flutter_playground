import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/authentication/login_form_screen.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onUsePhoneEmailButtonTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
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
                'Log in to TikTok',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                'Log in to your account to continue',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                onTap: () => _onUsePhoneEmailButtonTap(context),
                text: 'Use phone & email',
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
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onSignUpTap(context),
                  child: Text(
                    'Sign up',
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
