import 'package:flutter/material.dart';

import '../../../../../core/widgets/skeleton_list_view_widget.dart';

class RecommendedMoviesSkeletonLoader extends StatelessWidget {
  const RecommendedMoviesSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonListViewWidget(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      child: Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
