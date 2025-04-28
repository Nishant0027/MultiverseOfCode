import 'package:flutter/material.dart';

import '../../../../config/environment_config.dart';
import '../../../../core/constants/api_constants/api_queries.dart';
import '../../../../core/service/api_service.dart';
import '../model/movies_model.dart';

Future<List<MoviesListData>> fetchMoviesList(BuildContext context) async {
  String url = AppEnvironment.serviceBaseUrl + ApiQueries.moviesListQuery();
  List<MoviesListData> moviesList = [];

  await ApiService.getService(url: url).then((response) {
    try {
      if (response != null && response.statusCode == 200) {
        var res = MoviesModel.fromJson(response.data);
        moviesList = res.data;
      }
    } catch (e) {
      debugPrint("EXCEPTION : $e");
    }
  });
  return moviesList;
}
