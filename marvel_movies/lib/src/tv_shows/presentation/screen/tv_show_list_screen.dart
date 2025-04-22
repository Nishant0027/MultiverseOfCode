import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_grid_tile_widget.dart';
import '../../../../core/widgets/custom_grid_view_builder_widget.dart';
import '../../data/repository/tv_show_list_repository.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  void initState() {
    super.initState();
    TvShowListRepository()
        .fetchTvShowList()
        .then((value) => print(value))
        .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: TvShowListRepository().fetchTvShowList(),
        builder: (context, snapshot) {
          print("snapshot.data ${snapshot.data}");
          return CustomGridViewBuilderWidget(
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
          );
        },
      ),
    );
  }
}
