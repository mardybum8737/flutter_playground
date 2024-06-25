import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
    print(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          CupertinoSwitch(
            value: _notification,
            onChanged: _onNotificationChanged,
          ),
          SwitchListTile.adaptive(
            title: const Text('Enable Notifications'),
            value: _notification,
            onChanged: _onNotificationChanged,
          ),
          CheckboxListTile.adaptive(
              checkColor: Colors.white,
              activeColor: Theme.of(context).primaryColor,
              value: _notification,
              onChanged: _onNotificationChanged,
              title: const Text('Enable Notifications')),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2026));
              print(booking);
            },
            title: const Text('What is your birthday?'),
          ),
          // ListTile(
          //   onTap: () =>
          //       showAboutDialog(context: context, applicationVersion: '1.0.0'),
          //   title: const Text(
          //     'About',
          //     style: TextStyle(
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          //   subtitle: const Text('About this app...'),
          // ),
          ListTile(
            title: const Text('Log out (iOS)'),
            textColor: Colors.blueAccent,
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you want to log out?'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('No'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoDialogAction(
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true,
                    child: const Text('Yes'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Log out (Android)'),
            textColor: Colors.blueAccent,
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you want to log out?'),
                actions: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.car),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.ccMastercard),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Log out (iOS / BottomSheet)'),
            textColor: Colors.blueAccent,
            onTap: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: const Text('Are you sure?'),
                message: const Text('Do you want to log out?'),
                actions: [
                  CupertinoActionSheetAction(
                    child: const Text('No'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoActionSheetAction(
                    isDestructiveAction: true,
                    child: const Text('Yes'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),

          const AboutListTile(),
        ],
      ),
    );
  }
}
