import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  // Ticker is like a clock that ticks every frame
  // SingleTickerProvierStateMixin helps not to waste resources

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "All activity",
      "icon": FontAwesomeIcons.solidMessage,
    },
    {
      "title": "Likes",
      "icon": FontAwesomeIcons.solidHeart,
    },
    {
      "title": "Comments",
      "icon": FontAwesomeIcons.solidComments,
    },
    {
      "title": "Mentions",
      "icon": FontAwesomeIcons.at,
    },
    {
      "title": "Followers",
      "icon": FontAwesomeIcons.solidUser,
    },
    {
      "title": "From TikTok",
      "icon": FontAwesomeIcons.tiktok,
    }
  ];

  bool _showBarrier = false;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> _arrowAnimation = Tween(
    begin: 0.0,
    end: 0.5,
  ).animate(_animationController);

  late final Animation<Offset> _panelAnimation = Tween(
    begin: const Offset(0, -1),
    end: const Offset(0, 0),
  ).animate(_animationController);

  late final Animation<Color?> _barrierAnimtion = ColorTween(
    begin: Colors.transparent,
    end: Colors.black.withOpacity(0.5),
  ).animate(_animationController);

  final List<String> _notifications =
      List.generate(20, (index) => 'Notification $index');

  void _onDismissed(String notification) {
    setState(() {
      _notifications.remove(notification);
    });
  }

  void _toggleAnimation() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_notifications.length);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _toggleAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('All activities'),
              Gaps.h4,
              RotationTransition(
                turns: _arrowAnimation,
                child: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Sizes.size14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Gaps.v14,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                ),
                child: Text(
                  'New',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Gaps.v14,
              for (var notification in _notifications)
                Dismissible(
                  key: Key(notification),
                  onDismissed: (direction) => _onDismissed(notification),
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.green.shade400,
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: Sizes.size16,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.check,
                        color: Colors.white,
                        size: Sizes.size32,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red.shade400,
                    child: const Padding(
                      padding: EdgeInsets.only(
                        right: Sizes.size16,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.trashCan,
                        color: Colors.white,
                        size: Sizes.size32,
                      ),
                    ),
                  ),
                  child: ListTile(
                    minVerticalPadding: Sizes.size16,
                    leading: Container(
                      width: Sizes.size52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: Sizes.size1,
                        ),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.bell,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        text: "Account updates:",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: Sizes.size16,
                        ),
                        children: [
                          const TextSpan(
                            text: ' Upload longer videos',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                              text: ' $notification',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                              ))
                        ],
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
            ],
          ),
          if (_showBarrier)
            AnimatedModalBarrier(
              color: _barrierAnimtion,
              dismissible: true,
              onDismiss: _toggleAnimation,
            ),
          SlideTransition(
            position: _panelAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.size20),
                  bottomRight: Radius.circular(Sizes.size20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var tab in _tabs)
                    ListTile(
                      title: Row(
                        children: [
                          FaIcon(
                            tab['icon'],
                            color: Colors.black,
                            size: Sizes.size12,
                          ),
                          Gaps.h20,
                          Text(
                            tab['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
