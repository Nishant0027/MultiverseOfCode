import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_grid_tile_widget.dart';
import '../../../../core/widgets/custom_grid_view_builder_widget.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGridViewBuilderWidget(
        items: [
          "https://res.cloudinary.com/augustomarcelo/image/upload/v1676219587/mcuapi/gallery/tv_shows/wandavision/posters/1.jpg",
        ],
        itemBuilder:
            (_, index) => CustomGridTileWidget(
              onTap: () {},
              coverUrl:
                  "https://res.cloudinary.com/augustomarcelo/image/upload/v1676219587/mcuapi/gallery/tv_shows/wandavision/posters/1.jpg",
              id: 1,
            ),
      ),
    );
  }
}
