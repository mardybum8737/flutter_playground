import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  void dispose() {
    print(_clicks);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clicks',
            style: const TextStyle(fontSize: 24),
          ),
          TextButton(
            onPressed: _increase,
            style: const ButtonStyle(
              textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 24)),
            ),
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}