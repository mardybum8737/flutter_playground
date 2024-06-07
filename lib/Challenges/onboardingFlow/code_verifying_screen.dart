import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/widgets/active_button.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CodeVerifyingScreen extends StatefulWidget {
  const CodeVerifyingScreen({super.key});

  @override
  State<CodeVerifyingScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CodeVerifyingScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.twitter,
            color: Colors.blueAccent, size: 32),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
              padding: EdgeInsets.all(14),
              child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        ),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'We sent you a code',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'experience',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Track where you see Twitter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'content across the web',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v40,
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Twitter uses this data to',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1),
                    ),
                    Text(
                      'personalize your experience. This',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1),
                    ),
                    Text(
                      'web browsing history will never be',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1),
                    ),
                    Text(
                      'stored with your name, email, or',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                      ),
                    ),
                    Text(
                      'phone number.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
                Gaps.h40,
                Switch.adaptive(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                      print(isChecked);
                    });
                  },
                ),
              ],
            ),
            Gaps.h24,
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ActButton(
            text: 'Next',
            onTap: () {},
            color: Colors.blue,
            icon: const SizedBox(
              width: 0,
            ),
            isActivated: isChecked),
      ),
    );
  }
}
