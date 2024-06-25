import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_playground/Challenges/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/videos/widgets/video_comments.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/videos/widgets/video_console_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;

  late final AnimationController _animationController;

  bool _isPaused = false;
  final Duration _animationDuration = const Duration(milliseconds: 200);

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/IMG_3055.mp4");
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChange);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );

    // _animationController.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentButtonTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
    // async , await을 통해 showModalBottomSheet이 끝날때까지 기다림
    // 그래서 showModalBottomSheet이 끝나면 _onTogglePause()를 실행
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: AnimatedOpacity(
                        duration: _animationDuration,
                        opacity: _isPaused ? 1 : 0,
                        child: const FaIcon(
                          FontAwesomeIcons.play,
                          color: Colors.white,
                          size: Sizes.size52,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 10,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "@니꼬",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size20),
              ),
              Gaps.v16,
              Text(
                "This is my house in Thailand!!!",
                style: TextStyle(color: Colors.white, fontSize: Sizes.size16),
              ),
            ]),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    foregroundImage: NetworkImage('https://picsum.photos/200'),
                    radius: Sizes.size28,
                    child: Text('니꼬'),
                  ),
                  Gaps.v24,
                  const VideoConsoleButton(
                      icon: FontAwesomeIcons.solidHeart, text: '2.9M'),
                  Gaps.v24,
                  GestureDetector(
                    onTap: () => _onCommentButtonTap(context),
                    child: const VideoConsoleButton(
                        icon: FontAwesomeIcons.solidComment, text: '33K'),
                  ),
                  Gaps.v24,
                  const VideoConsoleButton(
                      icon: FontAwesomeIcons.share, text: 'Share'),
                ],
              ))
        ],
      ),
    );
  }
}
//           