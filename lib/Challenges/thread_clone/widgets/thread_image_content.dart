import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadImageContent extends StatelessWidget {
  const ThreadImageContent({
    super.key,
    required this.userImage,
    required this.contentText,
    required this.contentImage,
    required this.timeAgo,
    required this.replies,
    required this.likes,
    required this.isVerified,
    required this.replyImage1,
    required this.replyImage2,
    required this.replyImage3,
    required this.username,
  });

  final String username;
  final String userImage;
  final String contentText;
  final String contentImage;
  final String timeAgo;
  final int replies;
  final int likes;
  final bool isVerified;
  final String replyImage1;
  final String replyImage2;
  final String replyImage3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Gaps.v4,
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black,
                      ),
                      width: 40,
                      height: 40,
                      child: Image.network(userImage, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Gaps.v8,
              SizedBox(
                width: 2,
                height: 240,
                child: Container(
                  color: Colors.black12,
                ),
              ),
              Gaps.v8,
              SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black,
                        ),
                        width: 20,
                        height: 20,
                        child: Image.network(replyImage1, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 0,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black,
                        ),
                        width: 16,
                        height: 16,
                        child: Image.network(replyImage2, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 16,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black,
                        ),
                        width: 14,
                        height: 14,
                        child: Image.network(replyImage3, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gaps.h16,
          SizedBox(
            width: 342,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.05,
                          ),
                        ),
                        Gaps.h8,
                        isVerified
                            ? const FaIcon(FontAwesomeIcons.solidCircleCheck,
                                size: 12, color: Colors.blue)
                            : const SizedBox(),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          timeAgo,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                        Gaps.h12,
                        const FaIcon(FontAwesomeIcons.ellipsis, size: 16),
                      ],
                    ),
                  ],
                ),
                Gaps.v4,
                Text(
                  contentText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Gaps.v8,
                SizedBox(
                  width: 342,
                  height: 200,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black12,
                    ),
                    child: Image.network(contentImage, fit: BoxFit.cover),
                  ),
                ),
                Gaps.v16,
                const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.heart),
                    Gaps.h24,
                    FaIcon(FontAwesomeIcons.comment),
                    Gaps.h24,
                    FaIcon(FontAwesomeIcons.arrowsRotate),
                    Gaps.h24,
                    FaIcon(
                      FontAwesomeIcons.paperPlane,
                    ),
                  ],
                ),
                Gaps.v16,
                Row(
                  children: [
                    Text(
                      replies.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                    ),
                    Gaps.h4,
                    const Text(
                      'replies',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                    ),
                    Gaps.h6,
                    const Icon(Icons.circle, size: 3, color: Colors.black38),
                    Gaps.h6,
                    Text(
                      likes.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                    ),
                    Gaps.h4,
                    const Text(
                      'likes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
