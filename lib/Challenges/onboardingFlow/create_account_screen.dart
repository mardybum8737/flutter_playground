import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/onboardingFlow/customize_screen.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Map<String, String> formData = {};

    DateTime selectedDate = DateTime.now();
    TextEditingController birthdayController = TextEditingController();

    void setTextFieldDate(DateTime date) {
      final textDate = date.toString().split(" ").first;
      birthdayController.value = TextEditingValue(text: textDate);
    }

    void dateOfBirthSelected(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              maximumDate: selectedDate,
              initialDateTime: selectedDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: setTextFieldDate,
            ),
          );
        },
      );
    }

    String nameNotifier = '';

    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.twitter,
            color: Colors.blueAccent, size: 32),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(14),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            children: [
              Gaps.v24,
              const Text(
                'Create your account',
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v28,
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        nameNotifier = value;
                      },
                      cursorColor: Colors.blueAccent,
                      style: const TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueAccent),
                      decoration: InputDecoration(
                        suffixIcon: nameNotifier.isNotEmpty
                            ? const Icon(
                                Icons.check_circle_rounded,
                                size: Sizes.size20,
                                color: Colors.green,
                              )
                            : const SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        alignLabelWithHint: true,
                        labelText: 'Name',
                        labelStyle: const TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['name'] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.blueAccent,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Phone number or email address',
                      ),
                      validator: (value) {
                        final regExp = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (!regExp.hasMatch(value!)) {
                          return "Please enter a valid email address.";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['email'] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: () => dateOfBirthSelected(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          enabled: true,
                          cursorColor: Colors.blueAccent,
                          controller: birthdayController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Date of Birth',
                          ),
                          validator: (value) {
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData['birthday'] = newValue;
                            }
                          },
                        ),
                      ),
                    ),
                    Gaps.v16,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  print(formData);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomizeScreen(),
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 100,
                height: 50,
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
