import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/sizes.dart';

class TwitterInterestButton extends StatefulWidget {
  const TwitterInterestButton({
    super.key,
    required this.interest,
    required this.onTap,
  });

  final String interest;

  final Function() onTap;

  @override
  State<TwitterInterestButton> createState() => _TwitterInterestButtonState();
}

class _TwitterInterestButtonState extends State<TwitterInterestButton> {
  bool _isSelected = false;

  void _byOnTap() {
    if (widget.onTap == false) {
      print('false');
      return;
    } else {
      print('true');
      widget.onTap();
      setState(() {
        _isSelected = !_isSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _byOnTap,
      child: AnimatedContainer(
        width: 190,
        height: 100,
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12, horizontal: Sizes.size16),
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blueAccent : Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(Sizes.size12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _isSelected
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 20,
                      )
                    : const SizedBox(
                        width: 0,
                      )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    widget.interest,
                    style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.bold,
                        color: _isSelected ? Colors.white : Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
