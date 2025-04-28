import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonGridViewWidget extends StatelessWidget {
  final int itemCount;
  final Widget child;
  const SkeletonGridViewWidget({
    super.key,
    required this.itemCount,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color.fromARGB(255, 88, 89, 90),
      baseColor: const Color.fromARGB(255, 50, 52, 68),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => child,
      ),
    );
  }
}
