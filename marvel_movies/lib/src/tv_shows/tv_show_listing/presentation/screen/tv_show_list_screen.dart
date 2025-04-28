import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/extensions/build_context_extension.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/custom_grid_tile_widget.dart';
import '../../../../../core/widgets/custom_grid_view_builder_widget.dart';
import '../../../../../core/widgets/no_data_found_widget.dart';
import '../../../../movies/presentation/widget/movies_list_skeleton_loader.dart';
import '../provider/tv_shows_provider.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    Future.delayed(Duration.zero, () {
      if (mounted) {
        Provider.of<TvShowsProvider>(context, listen: false).getData(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TvShowsProvider>(
        builder: (context, tvsShow, child) {
          return tvsShow.isLoading == true
              ? MoviesListSkeletonLoader()
              : tvsShow.tvShowModel.isEmpty
              ? NoDataFoundWidget()
              : CustomGridViewBuilderWidget(
                items: tvsShow.tvShowModel,
                itemBuilder: (_, index) {
                  var tvShowData = tvsShow.tvShowModel[index];
                  return CustomGridTileWidget(
                    onTap:
                        () => context.navigator.pushNamed(
                          Routes.tvShowsDetails,
                          arguments: tvShowData,
                        ),
                    coverUrl: tvShowData.coverUrl ?? "",
                    id: tvShowData.id ?? 0,
                  );
                },
              );
        },
      ),
    );
  }
}
