import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants/app_constants.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_circular_indicator.dart';
import '../../data/model/mcu_model.dart';
import '../provider/provider.dart';
import '../widget/drag_handle_widget.dart';

class MoviesDetailsScreen extends StatefulWidget {
  const MoviesDetailsScreen({super.key});

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  int id = 0;
  int index = 0;
  Data provider = Data(
    id: 0,
    title: '',
    releaseDate: '',
    boxOffice: '',
    duration: 0,
    overview: '',
    coverUrl: '',
    trailerUrl: '',
    directedBy: '',
    phase: 0,
    saga: '',
    chronology: 0,
    postCreditScenes: 0,
    imdbId: '',
  );
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      setState(() {
        id = routeArgs['id'];
        Provider.of<McuDataProvider>(context, listen: false).getRecent(id);
      });

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
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // id = routeArgs['index'];

    // final provider =
    //     Provider.of<McuDataProvider>(context).mcuModel.singleWhere((element) {
    //   return element.id == id;
    // });

    final recommendedMovies =
        Provider.of<McuDataProvider>(context).mcuRecommendation;
    return PopScope(
      // return WillPopScope(
      // onWillPop: () async {
      //   Navigator.pop(context);
      //   return Provider.of<McuDataProvider>(
      //     context,
      //     listen: false,
      //   ).setMcuRecommendation([]);
      // },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstants.backgroundGrey,

        body:
            provider == null
                ? const CustomCircularIndicator()
                : NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        elevation: 0,
                        leading: IconButton(
                          onPressed: () {
                            Provider.of<McuDataProvider>(
                              context,
                              listen: false,
                            ).setMcuRecommendation([]);
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        expandedHeight: deviceData.size.height / 1.3,
                        flexibleSpace: FlexibleSpaceBar(
                          background:
                          // BlurHash(
                          //     hash: AppConstants.imageHashValue,
                          //     image: provider.coverUrl,
                          //   ),
                          Hero(
                            tag: 'movie$id',
                            child: Image.network(
                              provider.coverUrl,
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
                      ),
                    ];
                  },
                  body: Stack(
                    children: [
                      /// IRON MAN: L59Gm\$V?Afbb~WD%NfaKM]Na9ZIU
                      /// Doctor Strange: LSIqu|xaEQjF~VS5M{xC5YNHROt6
                      const BlurHash(hash: AppConstants.imageHashValue),
                      DragHandleWidget(),
                      SingleChildScrollView(
                        child: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(
                              // top: MediaQueryData.fromView(window).padding.top,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// MOVIE TITLE
                                      Text(
                                        provider.title,
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),
                                      ),

                                      /// MOVIE RELEASE DATE
                                      provider.releaseDate == '' ||
                                              provider.releaseDate.isEmpty
                                          ? Container()
                                          : const SizedBox(height: 20),
                                      provider.releaseDate == '' ||
                                              provider.releaseDate.isEmpty
                                          ? Container()
                                          : Align(
                                            alignment: Alignment.topRight,
                                            child: RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                  color: Colors.amber,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                text: AppConstants.releaseDate,
                                                children: [
                                                  TextSpan(
                                                    text: DateFormat(
                                                      'dd, MMM yyyy',
                                                    ).format(
                                                      DateTime.parse(
                                                        provider.releaseDate,
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                      /// MOVIE Chronology
                                      provider.chronology == 0
                                          ? Container()
                                          : RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              text: AppConstants.chronology,
                                              children: [
                                                TextSpan(
                                                  text:
                                                      provider.chronology
                                                          .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                      /// DURATION
                                      provider.duration == 0
                                          ? Container()
                                          : const SizedBox(height: 20),
                                      provider.duration == 0
                                          ? Container()
                                          : RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              text: AppConstants.duration,
                                              children: [
                                                TextSpan(
                                                  text:
                                                      provider.duration
                                                          .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                      /// OVERVIEW
                                      provider.overview.isEmpty
                                          ? Container()
                                          : const SizedBox(height: 20),
                                      provider.overview.isEmpty
                                          ? Container()
                                          : RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              text: AppConstants.overview,
                                              children: [
                                                TextSpan(
                                                  text:
                                                      provider.overview
                                                          .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    wordSpacing: 2,
                                                    height: 1.4,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                      /// DIRECTED BY
                                      provider.directedBy.isEmpty
                                          ? Container()
                                          : const SizedBox(height: 20),
                                      provider.directedBy.isEmpty
                                          ? Container()
                                          : RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              text: AppConstants.directedBy,
                                              children: [
                                                TextSpan(
                                                  text: provider.directedBy,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                      /// POST CREDIT SCENES
                                      provider.postCreditScenes == 0
                                          ? Container()
                                          : const SizedBox(height: 20),
                                      provider.postCreditScenes == 0
                                          ? Container()
                                          : RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              text: AppConstants.postCredits,
                                              children: [
                                                TextSpan(
                                                  text:
                                                      " ${provider.postCreditScenes}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),

                                /// Trailer video player
                                // VideoPlayerWidget(trailerUrl: provider.trailerUrl),
                                const SizedBox(height: 20),

                                /// Related Movies Recommendation
                                /// Text
                                recommendedMovies.isEmpty
                                    ? Container()
                                    : const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Text(
                                        AppConstants.recommendedMovies,
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),

                                /// List View Horizontal
                                Container(
                                  height: 200,
                                  width: deviceData.size.width,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child:
                                      Provider.of<McuDataProvider>(
                                                context,
                                              ).isListLoading ==
                                              true
                                          ? const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomCircularIndicator(),
                                            ],
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
                                                      'id':
                                                          recommendedMovies[i]
                                                              .id,
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  height: 200,
                                                  width: 150,
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15,
                                                        ),
                                                    child: FadeInImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        recommendedMovies[i]
                                                            .coverUrl,
                                                      ),
                                                      placeholder:
                                                          const AssetImage(
                                                            AppConstants
                                                                .placeHolderAsset2,
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
                                const SizedBox(height: 80),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
