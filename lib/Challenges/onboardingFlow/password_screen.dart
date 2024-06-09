import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/constants/gaps.dart';
import 'package:flutter_playground/Challenges/constants/sizes.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/interests_screen.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/widgets/twitter_form_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPasswordScreen extends StatefulWidget {
  const TwitterPasswordScreen({super.key});

  @override
  State<TwitterPasswordScreen> createState() => _TwitterPasswordScreenState();
}

class _TwitterPasswordScreenState extends State<TwitterPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TwitterInterestsScreen();
        },
      ),
    );
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                const Text(
                  'You\'ll need a password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Gaps.v12,
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Make sure it\'s 8 characters or more.',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1),
                        ),
                      ],
                    ),
                  ],
                ),
                Gaps.v40,
                TextField(
                  obscureText: _obscureText,
                  onEditingComplete: _onSubmit,
                  autocorrect: false,
                  controller: _passwordController,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                            size: Sizes.size24,
                          ),
                        ),
                        Gaps.h16,
                        _isPasswordValid()
                            ? const Icon(
                                Icons.check_circle,
                                color: Color.fromARGB(255, 77, 172, 121),
                                size: Sizes.size24,
                              )
                            : const SizedBox(
                                width: 0,
                              ),
                      ],
                    ),
                    hintText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 300),
                TwitterFormButton(
                  onTap: _onSubmit,
                  disabled: !_isPasswordValid(),
                  color: Colors.blueAccent,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
