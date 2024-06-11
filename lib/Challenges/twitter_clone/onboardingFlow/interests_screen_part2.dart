import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/constants/gaps.dart';
import 'package:flutter_playground/Challenges/twitter_clone/onboardingFlow/initial_screen.dart';
import 'package:flutter_playground/Challenges/twitter_clone/onboardingFlow/interest_button_small.dart';
import 'package:flutter_playground/Challenges/twitter_clone/onboardingFlow/widgets/interest_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const music = [
  "Rap",
  "Pop",
  "Rock",
  "Country",
  "R&B",
  "Indie",
  "Electronic",
  "Jazz",
  "Classical",
  "Blues",
  "Reggae",
  "Metal",
  "K-Pop",
  "Latin",
  "Folk",
  "World",
  "Soul",
  "Soundtrack",
  "Reggaeton",
  "Funk",
  "Disco",
  "Opera",
  "Acoustic",
  "Alternative",
  "Chill",
  "House",
  "Techno",
  "Trance",
  "Drum & Bass",
];

const entertainment = [
  "Anime",
  "Movies & TV",
  "Harry Potter",
  "Marvel",
  "DC Comics",
  "Star Wars",
  "Game of Thrones",
  "Disney",
  "Horror",
  "Comedy",
  "Action",
  "Adventure",
  "Sci-Fi",
  "Fantasy",
  "Romance",
  "Documentary",
  "Musical",
  "Thriller",
  "Crime",
  "Western",
  "War",
  "History",
  "Biography",
];

class TwitterInterests2Screen extends StatefulWidget {
  const TwitterInterests2Screen({super.key});

  @override
  State<TwitterInterests2Screen> createState() =>
      _TwitterInterests2ScreenState();
}

class _TwitterInterests2ScreenState extends State<TwitterInterests2Screen> {
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
          return const InitialScreen();
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
                  SizedBox(height: 24),
                  Text(
                    'What do you want to see on Twitter?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    'Interests are used to personalize your experience and will be visible on your profile.',
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
            Column(
              children: [
                Gaps.v28,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Music',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v36,
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 160,
                    child: Wrap(
                      direction: Axis.vertical,
                      runSpacing: 6,
                      spacing: 6,
                      children: [
                        for (var genre in music)
                          TwitterSmallInterestButton(
                            title: genre,
                            onTap: selected == 3 ? _onCountThree : _onTap,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gaps.v20,
            SizedBox(
              height: 1,
              width: double.infinity,
              child: Container(
                color: Colors.black12,
              ),
            ),
            Column(
              children: [
                Gaps.v28,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Music',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v36,
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 160,
                    child: Wrap(
                      runAlignment: WrapAlignment.start,
                      alignment: WrapAlignment.start,
                      direction: Axis.vertical,
                      runSpacing: 6,
                      spacing: 6,
                      children: [
                        for (var genre in entertainment)
                          TwitterSmallInterestButton(
                            title: genre,
                            onTap: selected == 3 ? _onCountThree : _onTap,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                  onTap: _onNextTap,
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
