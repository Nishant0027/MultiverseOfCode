import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants/app_constants.dart';
import '../../../../core/extensions/date_extension.dart';
import '../../../../core/extensions/int_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/utility/utilities.dart';
import '../../../../core/widgets/custom_list_view_builder_widget.dart';
import '../../../tv_shows/tv_show_detail/presentation/widget/background_structure_widget.dart';
import '../../data/model/movies_model.dart';
import '../provider/provider.dart';
import '../widget/leading_button_widget.dart';
import '../widget/movie_title_widget.dart';
import '../widget/recommended_movies/recommended_movies_listtile_widget.dart';
import '../widget/recommended_movies/recommended_movies_skeleton_loader.dart';
import '../widget/title_text_widget.dart';

class MoviesDetailsScreen extends StatefulWidget {
  final int id;
  const MoviesDetailsScreen({super.key, required this.id});

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  int id = 0;

  MoviesListData provider = MoviesListData();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      id = widget.id;

      Provider.of<McuDataProvider>(context, listen: false).getRecent(id);

      /// Store and return elements as per id
      provider = Provider.of<McuDataProvider>(
        context,
        listen: false,
      ).moviesListData.singleWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);

    final recommendedMovies =
        Provider.of<McuDataProvider>(context).movieDetails;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        Provider.of<McuDataProvider>(
          context,
          listen: false,
        ).setMovieDetails([]);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BackgroundStructureWidget(
          leading: LeadingButtonWidget(),
          title: provider.title ?? ' ',
          coverUrl: provider.coverUrl ?? "",
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// MOVIE TITLE
                        MovieTitleWidget(title: provider.title ?? ""),

                        /// MOVIE RELEASE DATE
                        isReleaseDateEmpty
                            ? SizedBox.shrink()
                            : Align(
                              alignment: Alignment.topRight,
                              child: TitleValueWidget(
                                title: AppConstants.releaseDate,
                                value: provider.releaseDate?.formatddMMMyyyy(),
                              ),
                            ),

                        /// MOVIE Chronology
                        isCoronologyEmpty
                            ? SizedBox.shrink()
                            : TitleValueWidget(
                              title: AppConstants.chronology,
                              value: provider.chronology.toString(),
                            ),

                        /// DURATION
                        isDurationEmpty
                            ? SizedBox.shrink()
                            : TitleValueWidget(
                              title: AppConstants.duration,
                              value: Utilities.computeDurationFromIntToHHmm(
                                provider.duration,
                              ),
                            ),

                        /// OVERVIEW
                        isOverviewEmpty
                            ? SizedBox.shrink()
                            : TitleValueWidget(
                              title: AppConstants.overview,
                              value: provider.overview.toString(),
                              height: 1.4,
                            ),

                        /// DIRECTED BY
                        isDirectedByEmpty
                            ? SizedBox.shrink()
                            : TitleValueWidget(
                              title: AppConstants.directedBy,
                              value: provider.directedBy,
                            ),

                        /// POST CREDIT SCENES
                        isPostCreditScenesEmpty
                            ? SizedBox.shrink()
                            : TitleValueWidget(
                              title: AppConstants.postCredits,
                              value: " ${provider.postCreditScenes}",
                            ),
                      ],
                    ),
                  ),

                  /// Trailer video player
                  // VideoPlayerWidget(trailerUrl: provider.trailerUrl),
                  // const SizedBox(height: 20),

                  /// Related Movies Recommendation
                  recommendedMovies.isEmpty
                      ? SizedBox.shrink()
                      : const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TitleValueWidget(
                          title: AppConstants.recommendedMovies,
                        ),
                      ),

                  /// Recommendations Horizontal List View
                  Container(
                    height: 200,
                    width: deviceData.size.width,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child:
                        Provider.of<McuDataProvider>(
                                  context,
                                ).isMovieDetailsLoading ==
                                true
                            ? RecommendedMoviesSkeletonLoader()
                            : CustomListViewBuilderWidget(
                              scrollDirection: Axis.horizontal,
                              items: recommendedMovies,
                              itemBuilder: (context, i) {
                                return RecommendedMoviesListTileWidget(
                                  id: recommendedMovies[i].id,
                                  recommendedMovies: recommendedMovies[i],
                                );
                              },
                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get isCoverUrlEmpty => provider.coverUrl.isNullOrEmpty();

  bool get isPostCreditScenesEmpty => provider.postCreditScenes.isNullOrEmpty();

  bool get isDirectedByEmpty => provider.directedBy.isNullOrEmpty();

  bool get isOverviewEmpty => provider.overview.isNullOrEmpty();

  bool get isDurationEmpty => provider.duration.isNullOrEmpty();

  bool get isCoronologyEmpty => provider.chronology.isNullOrEmpty();

  bool get isReleaseDateEmpty => provider.releaseDate == null;
}
