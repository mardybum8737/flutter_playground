import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/Challenges/constants/gaps.dart';
import 'package:flutter_playground/Challenges/constants/sizes.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/password_screen.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/widgets/active_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CodeVerifyingScreen extends StatefulWidget {
  const CodeVerifyingScreen({super.key});

  @override
  State<CodeVerifyingScreen> createState() => _CustomizeScreenState();
}

final myController = TextEditingController();

class _CustomizeScreenState extends State<CodeVerifyingScreen> {
  bool isChecked = false;
  int totalCodeLength = 6;
  List<String> txt = List.filled(6, '');

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSaved(String? value, int index) {
    txt[index - 1] = value!;
    bool isAllFilled = txt.every((element) => element.isNotEmpty);

    if (isAllFilled) {
      setState(() {
        isChecked = true;
      });
    } else {
      setState(() {
        isChecked = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TwitterPasswordScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      final text = myController.text;
      myController.value = myController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
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
                const SizedBox(height: 40),
                const Text(
                  'We sent you a code',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Gaps.v28,
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter it below to verify',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1),
                        ),
                        Text(
                          'mardybum8999@gmail.com',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1),
                        ),
                      ],
                    ),
                  ],
                ),
                Gaps.v24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 1; i <= totalCodeLength; i++)
                      CodeTextField(
                        onSaved: _onSaved,
                        index: i,
                        totalCodeLength: totalCodeLength,
                      )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28),
                      child: isChecked
                          ? const Icon(
                              Icons.check_circle_rounded,
                              color: Color.fromARGB(255, 77, 172, 121),
                              size: Sizes.size36,
                            )
                          : const SizedBox(width: 0, height: 0),
                    ),
                  ],
                ),
                const SizedBox(height: 300),
                ActButton(
                    text: 'Next',
                    onTap: isChecked ? _onNextTap : () {},
                    color: Colors.blue,
                    icon: const SizedBox(
                      width: 0,
                    ),
                    isActivated: isChecked),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CodeTextField extends StatelessWidget {
  const CodeTextField(
      {super.key,
      required this.onSaved,
      required this.index,
      required this.totalCodeLength});

  final Function(String?, int)? onSaved;
  final int index;
  final int totalCodeLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: TextFormField(
        decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        )),
        onChanged: (value) {
          if (value.isNotEmpty && index == totalCodeLength) {
            onSaved!(value, index);
            return;
          } else if (value.isNotEmpty && index < totalCodeLength) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 1) {
            FocusScope.of(context).previousFocus();
          } else {
            onSaved!(value, index);
            return;
          }
          onSaved!(value, index);
        },
        // onSaved: onSaved,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
