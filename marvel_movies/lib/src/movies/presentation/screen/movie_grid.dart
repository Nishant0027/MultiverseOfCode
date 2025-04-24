import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../../../../core/routes/routes.dart";
import '../../../../core/widgets/custom_grid_tile_widget.dart';
import '../../../../core/widgets/custom_grid_view_builder_widget.dart';
import '../provider/provider.dart';

class MovieGrid extends StatefulWidget {
  const MovieGrid({super.key});

  @override
  State<MovieGrid> createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<McuDataProvider>(
      builder: (context, mcuProvider, child) {
        return CustomGridViewBuilderWidget(
          items: mcuProvider.mcuModel,
          itemBuilder: (context, i) {
            var mcuData = mcuProvider.mcuModel;

            return CustomGridTileWidget(
              id: mcuData[i].id ?? 0,
              coverUrl: mcuData[i].coverUrl ?? "",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.movieDetails,
                  arguments: mcuData[i],
                );
              },
            );
          },
        );
      },
    );
  }
}
