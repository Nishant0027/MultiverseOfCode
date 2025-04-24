import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants/app_constants.dart';
import '../../../../core/extensions/date_extension.dart';
import '../../../../core/extensions/int_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utility/utilities.dart';
import '../../../../core/widgets/custom_circular_indicator.dart';
import '../../data/model/mcu_model.dart';
import '../provider/provider.dart';
import '../widget/leading_button_widget.dart';
import '../widget/movie_title_widget.dart';
import '../widget/title_text_widget.dart';

class MoviesDetailsScreen extends StatefulWidget {
  final Data moviesData;
  const MoviesDetailsScreen({super.key, required this.moviesData});

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  int id = 0;
  int index = 0;
  Data provider = Data();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      id = widget.moviesData.id ?? 0;

      Provider.of<McuDataProvider>(context, listen: false).getRecent(id);

      /// Store and return elements as per id
      provider = Provider.of<McuDataProvider>(
        context,
        listen: false,
      ).mcuModel.singleWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);

    final recommendedMovies =
        Provider.of<McuDataProvider>(context).mcuRecommendation;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        // Navigator.pop(context);
        Provider.of<McuDataProvider>(
          context,
          listen: false,
        ).setMcuRecommendation([]);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                stretch: true,
                elevation: 0,
                leading: LeadingButtonWidget(
                  onTap: () {
                    Provider.of<McuDataProvider>(
                      context,
                      listen: false,
                    ).setMcuRecommendation([]);
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Colors.transparent,
                expandedHeight: deviceData.size.height / 1.3,
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      isCoverUrlEmpty
                          ? SizedBox.shrink()
                          : Image.network(
                            provider.coverUrl ?? '',
                            errorBuilder:
                                (context, error, stackTrace) => Center(
                                  child: Image.asset(
                                    AppConstants.placeHolderAsset,
                                  ),
                                ),
                            fit: BoxFit.cover,
                          ),
                ),
              ),
            ];
          },
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
                        Provider.of<McuDataProvider>(context).isListLoading ==
                                true
                            ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [CustomCircularIndicator()],
                            )
                            : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: recommendedMovies.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Routes.movieDetails,
                                      arguments: {
                                        'id': recommendedMovies[i].id,
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: FadeInImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          recommendedMovies[i].coverUrl,
                                        ),
                                        placeholder: const AssetImage(
                                          AppConstants.placeHolderAsset2,
                                        ),
                                      ),
                                      // BlurHash(
                                      //   hash: AppConstants.imageHashValue,
                                      //   image: recommendatedMovies[i]
                                      //       .coverUrl,
                                      // ),
                                    ),
                                  ),
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
