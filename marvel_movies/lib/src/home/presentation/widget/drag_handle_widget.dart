import 'package:flutter/material.dart';

class DragHandleWidget extends StatelessWidget {
  const DragHandleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: MediaQuery.sizeOf(context).width / 2 - 20,
      right: MediaQuery.sizeOf(context).width / 2 - 20,
      child: Container(
        height: 5,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
