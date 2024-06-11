import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/constants/gaps.dart';
import 'package:flutter_playground/Challenges/twitter_clone/onboardingFlow/interests_screen_part2.dart';
import 'package:flutter_playground/Challenges/twitter_clone/onboardingFlow/widgets/interest_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const interests = [
  "Fashion & beauty",
  "Outdoors",
  "Arts & culture",
  "Animation \n& comics",
  "Buisness\n& finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Sports",
  "News & politics",
  "Science & nature",
  "Technology",
  "Health & wellness",
  "Home & garden",
  "Education",
  "Parenting",
  "Books & writing",
  "Photography",
  "Auto",
  "Crafts",
  "DIY",
  "Fitness",
  "History",
  "Language",
  "Movies & TV",
  "Podcasts",
  "Shopping",
  "Social media",
  "Spirituality",
  "Style",
];

class TwitterInterestsScreen extends StatefulWidget {
  const TwitterInterestsScreen({super.key});

  @override
  State<TwitterInterestsScreen> createState() => _TwitterInterestsScreenState();
}

class _TwitterInterestsScreenState extends State<TwitterInterestsScreen> {
  int selected = 0;

  bool _onTap() {
    setState(() {
      selected++;
    });
    print(selected);
    return true;
  }

  bool _onCountThree() {
    return false;
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TwitterInterests2Screen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28),
                  Text(
                    'What do you want to see on Twitter?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1),
                  ),
                ],
              ),
            ),
            Gaps.v20,
            SizedBox(
              height: 1,
              width: double.infinity,
              child: Container(
                color: Colors.black12,
              ),
            ),
            Gaps.v20,
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                for (var interest in interests)
                  TwitterInterestButton(
                    interest: interest,
                    onTap: selected == 3 ? _onCountThree : _onTap,
                  ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$selected of 3 selected'),
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 200),
                child: GestureDetector(
                  onTap: selected == 3 ? _onNextTap : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: selected == 3 ? Colors.black : Colors.black38,
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
