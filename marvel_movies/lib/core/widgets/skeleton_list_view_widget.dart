import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonListViewWidget extends StatelessWidget {
  final Widget child;
  final int itemCount;
  final Axis scrollDirection;
  const SkeletonListViewWidget({
    super.key,
    required this.child,
    required this.itemCount,
    required this.scrollDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color.fromARGB(255, 88, 89, 90),
      baseColor: const Color.fromARGB(255, 50, 52, 68),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        itemCount: itemCount,
        itemBuilder: (context, index) => child,
      ),
    );
  }
}
