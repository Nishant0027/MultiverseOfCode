import 'package:flutter/material.dart';
import 'package:marvel_movies/core/extensions/date_extension.dart';
import 'package:marvel_movies/src/movies/presentation/widget/movie_title_widget.dart';

import '../../../../../core/constants/app_constants/app_constants.dart';
import '../../../../movies/presentation/widget/title_text_widget.dart';
import '../../../data/model/tv_show_list_model.dart';
import '../widget/background_structure_widget.dart';

class TvShowDetailScreen extends StatelessWidget {
  final TvShowData tvShowData;
  const TvShowDetailScreen({super.key, required this.tvShowData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStructureWidget(
        title: tvShowData.title ?? "",
        coverUrl: tvShowData.coverUrl ?? "",
        season: tvShowData.season,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                MovieTitleWidget(title: tvShowData.title ?? ""),
                const SizedBox(height: 8),
                // Release Date
                TitleValueWidget(
                  title: AppConstants.releaseDate,
                  value: tvShowData.releaseDate?.formatddMMMyyyy(),
                ),
                // Last Aired Date
                TitleValueWidget(
                  title: AppConstants.lastAiredDate,
                  value: tvShowData.lastAiredDate?.formatddMMMyyyy(),
                ),
                // Seasons
                TitleValueWidget(
                  title: AppConstants.seasons,
                  value: tvShowData.numberEpisodes.toString(),
                ),
                // Directed By
                TitleValueWidget(
                  title: AppConstants.directedBy,
                  value: tvShowData.directedBy ?? "",
                  height: 1.4,
                ),
                // Overview
                TitleValueWidget(
                  title: AppConstants.overview,
                  value: tvShowData.overview.toString(),
                  height: 1.4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
