import 'package:flutter/material.dart';

class MovieTitleWidget extends StatelessWidget {
  final String title;
  const MovieTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
