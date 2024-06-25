import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/settings/settings_screen.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/users/widgets/persitent_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('Aaron Bang'),
                actions: [
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                    onPressed: _onGearPressed,
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: Sizes.size48,
                      foregroundColor: Colors.orange.shade800,
                      foregroundImage:
                          const NetworkImage('https://picsum.photos/200'),
                    ),
                    Gaps.v20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '@Aaron Bang',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h6,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.blueAccent,
                          size: Sizes.size18,
                        ),
                      ],
                    ),
                    Gaps.v20,
                    SizedBox(
                      height: Sizes.size52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                '10M',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v2,
                              Text(
                                'Followers',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                          ),
                          Column(
                            children: [
                              const Text(
                                '97',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v2,
                              Text(
                                'Following',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                          ),
                          Column(
                            children: [
                              const Text(
                                '194.7M',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v2,
                              Text(
                                'Likes',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.33,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size12,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(Sizes.size4),
                          ),
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        'All highlights and where to watch live mathces on FIFA + I wonder how it would look',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size14,
                        ),
                        Gaps.h4,
                        Text(
                          'www.youtube.com/aaronbang',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersitentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Sizes.size2,
                  mainAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 14,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 14,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/pink.jpg',
                          image:
                              'https://i.pinimg.com/564x/ab/04/a0/ab04a0fdf32537cc1b70bc1e5fcd6cae.jpg'),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('Page two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
