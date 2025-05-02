import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_extension.dart';
import '../../../../../core/widgets/image_wrapper_widget.dart';

class BackgroundStructureWidget extends StatelessWidget {
  final String title;
  final String coverUrl;
  final int? season;
  final Widget body;
  final Widget? leading;
  final bool pinned;
  final bool stretch;

  const BackgroundStructureWidget({
    super.key,
    required this.body,
    required this.title,
    required this.coverUrl,
    this.season,
    this.leading,
    this.pinned = true,
    this.stretch = false,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: true,
            expandedHeight: context.mediaQuerySizeOf.height * 0.7,
            pinned: pinned,
            stretch: stretch,
            elevation: 0,
            leading: leading,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate whether the app bar is collapsed
                bool isCollapsed =
                    constraints.biggest.height <=
                    kToolbarHeight + context.mediaQuery.padding.top;

                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  titlePadding: EdgeInsets.only(
                    left: title.length > 20 ? 60 : 16,
                    bottom: 16,
                    right: 16,
                  ),
                  centerTitle: true,
                  title:
                      isCollapsed
                          ? FittedBox(
                            child: Text(
                              maxLines: 1,
                              title,
                              style: const TextStyle(color: Colors.white),
                            ),
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
