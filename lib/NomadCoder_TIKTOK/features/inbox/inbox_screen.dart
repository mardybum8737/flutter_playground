import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/features/inbox/activity_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onDmPressed() {}

  void _onActivityTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ActivityScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        actions: [
          IconButton(
            onPressed: _onDmPressed,
            icon: const FaIcon(
              FontAwesomeIcons.paperPlane,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => _onActivityTap(context),
            title: const Text(
              'Activity',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size18,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
          Container(
            height: Sizes.size1,
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: Container(
              width: Sizes.size44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                  size: Sizes.size20,
                ),
              ),
            ),
            title: const Text(
              'New followers',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size18,
              ),
            ),
            subtitle: Text(
              'New followers, likes, and comments',
              style: TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
