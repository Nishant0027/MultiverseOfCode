import 'package:flutter/material.dart';

import '../../../../core/widgets/skeleton_grid_view_widget.dart';

class MoviesListSkeletonLoader extends StatelessWidget {
  const MoviesListSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonGridViewWidget(
      itemCount: 10,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
