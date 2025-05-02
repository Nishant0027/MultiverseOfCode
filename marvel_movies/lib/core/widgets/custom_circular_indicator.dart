import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double? value;
  const CustomCircularIndicator({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: Colors.white60,
      strokeWidth: 2,
      value: value,
    );
  }
}
