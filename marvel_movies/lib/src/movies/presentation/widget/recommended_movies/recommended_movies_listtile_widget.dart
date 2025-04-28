import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants/app_constants.dart';
import '../../../../../core/routes/routes.dart';
import '../../../data/model/movie_details_model.dart';

class RecommendedMoviesListTileWidget extends StatelessWidget {
  final MovieDetailsModel recommendedMovies;
  final int id;
  const RecommendedMoviesListTileWidget({
    super.key,
    required this.recommendedMovies,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          Routes.movieDetails,
          arguments: id,
        );
      },
      child: Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage(recommendedMovies.coverUrl),
            placeholder: const AssetImage(AppConstants.placeHolderAsset2),
          ),
        ),
      ),
    );
  }
}
