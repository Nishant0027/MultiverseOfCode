import 'package:flutter/material.dart';

class TitleValueWidget extends StatelessWidget {
  final String title;
  final String? value;
  final double? wordSpacing;
  final double? height;
  final double? letterSpacing;

  const TitleValueWidget({
    super.key,
    required this.title,
    this.value,
    this.wordSpacing,
    this.letterSpacing,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: const TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
        text: title,
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
