import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    _isWriting = false;
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size16),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text('22758 comments'),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.xmark),
              onPressed: _onClosePressed,
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => Gaps.v12,
                padding: const EdgeInsets.only(
                  top: Sizes.size16,
                  bottom: Sizes.size96 + Sizes.size20,
                  left: Sizes.size16,
                  right: Sizes.size16,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      child: Text('니꼬'),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '니꼬',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Gaps.v4,
                          const Text(
                              'This is my house in Thailand!!! We have a pool and a garden. I love it here!'),
                        ],
                      ),
                    ),
                    Gaps.h10,
                    Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size18,
                          color: Colors.grey.shade500,
                        ),
                        Gaps.v4,
                        Text(
                          '52.2K',
                          style: TextStyle(color: Colors.grey.shade500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  color: Colors.white,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.shade500,
                        foregroundColor: Colors.white,
                        child: const Text('니꼬'),
                      ),
                      Gaps.h10,
                      Expanded(
                          child: TextField(
                        onTap: _onStartWriting,
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                            hintText: 'Add a comment...',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(right: Sizes.size14),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.at,
                                    color: Colors.grey.shade900,
                                  ),
                                  Gaps.h14,
                                  FaIcon(
                                    FontAwesomeIcons.gift,
                                    color: Colors.grey.shade900,
                                  ),
                                  Gaps.h14,
                                  FaIcon(
                                    FontAwesomeIcons.faceSmile,
                                    color: Colors.grey.shade900,
                                  ),
                                  Gaps.h14,
                                  if (_isWriting)
                                    GestureDetector(
                                      onTap: _stopWriting,
                                      child: FaIcon(
                                        FontAwesomeIcons.circleArrowUp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                ],
                              ),
                            )),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
