import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_extension.dart';
import '../../../../../core/utility/image_wrapper.dart';

class BackgroundStructureWidget extends StatelessWidget {
  final String title;
  final String coverUrl;
  final int? season;
  final Widget body;

  const BackgroundStructureWidget({
    super.key,

    required this.body,
    required this.title,
    required this.coverUrl,
    this.season,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: true,
            expandedHeight: context.mediaQuerySizeOf.height * 0.7,
            pinned: true,
            stretch: true,
            elevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate whether the app bar is collapsed
                bool isCollapsed =
                    constraints.biggest.height <=
                    kToolbarHeight + context.mediaQuery.padding.top;

                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title:
                      isCollapsed
                          ? Text(
                            title,
                            style: const TextStyle(color: Colors.white),
                          )
                          : null,
                  background:
                      coverUrl.isEmpty
                          ? SizedBox.shrink()
                          : ImageWrapper(url: coverUrl),
                );
              },
            ),
          ),
        ];
      },
      body: body,
    );
  }
}
