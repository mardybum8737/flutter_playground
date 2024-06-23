import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "Live",
  'Shopping',
  'Trending',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: 'initial Text');

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {
    print('Submitted $value');
  }

  void _onTapTabBar() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: const Center(
              child: FaIcon(
                FontAwesomeIcons.angleLeft,
                size: 24,
              ),
            ),
            title: CupertinoSearchTextField(
              placeholder: 'Search',
              controller: _textEditingController,
              autocorrect: true,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.sliders),
              ),
            ],
            bottom: TabBar(
                onTap: (value) => _onTapTabBar(),
                splashFactory: NoSplash.splashFactory,
                tabAlignment: TabAlignment.start,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                isScrollable: true,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.grey.shade500,
                labelColor: Colors.black,
                tabs: [
                  for (var tab in tabs)
                    Tab(
                      text: tab,
                    ),
                ]),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding: const EdgeInsets.all(
                    Sizes.size6,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Sizes.size10,
                    mainAxisSpacing: Sizes.size10,
                    childAspectRatio: 9 / 20,
                  ),
                  itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.size6),
                            ),
                            child: AspectRatio(
                              aspectRatio: 9 / 16,
                              child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/pink.jpg',
                                  image:
                                      'https://i.pinimg.com/564x/ab/04/a0/ab04a0fdf32537cc1b70bc1e5fcd6cae.jpg'),
                            ),
                          ),
                          Gaps.v6,
                          const Text(
                            "This is a very long caption for my tiktok that im uploading right now",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.v4,
                          DefaultTextStyle(
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      NetworkImage('https://picsum.photos/200'),
                                ),
                                Gaps.h6,
                                const Expanded(
                                  child: Text(
                                    "My avatar is going to be very long",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Gaps.h4,
                                FaIcon(
                                  FontAwesomeIcons.heart,
                                  size: 16,
                                  color: Colors.grey.shade600,
                                ),
                                Gaps.h2,
                                const Text(
                                  "2.9M",
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}
