import 'package:flutter/material.dart';

import '../../../../config/environment_config.dart';
import '../../../../core/constants/api_constants/api_queries.dart';
import '../../../../core/service/api_service.dart';
import '../model/movie_details_model.dart';

Future<List<MovieDetailsModel>> fetchMovieDetails(int id) async {
  String url =
      AppEnvironment.serviceBaseUrl +
      ApiQueries.moviesDetailsQueryWithId(id: id);
  List<MovieDetailsModel> mcuRecommendation = [];
  await ApiService.getService(url: url).then((response) {
    try {
      if (response != null && response.statusCode == 200) {
        var res = MovieDetailsModel.fromJson(response.data);
        mcuRecommendation = res.relatedMovies!;
      }
    } catch (e) {
      debugPrint("EXCEPTION : $e");
      return mcuRecommendation = [];
    }
  });
  return mcuRecommendation;
}
