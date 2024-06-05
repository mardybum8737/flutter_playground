import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan parentRichTextSpan(String text, List<TextSpan> children) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    children: children,
  );
}

TextSpan parentRichTextSpanLink(String text, List<TextSpan> children) {
  return TextSpan(
      text: text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.blueAccent,
        fontWeight: FontWeight.w400,
      ),
      children: children,
      recognizer: TapGestureRecognizer()..onTap = () {});
}

TextSpan richTextSpanLink(String text) {
  return TextSpan(
      text: text,
      style: const TextStyle(
          color: Colors.blueAccent, fontSize: 16, fontWeight: FontWeight.w400),
      recognizer: TapGestureRecognizer()..onTap = () {});
}

TextSpan richTextSpan(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );
}
