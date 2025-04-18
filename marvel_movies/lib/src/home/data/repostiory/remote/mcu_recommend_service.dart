import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../config/environment_config.dart';
import '../../../../../core/constants/api_constants/api_queries.dart';
import '../../model/mcu_recommendation_model.dart';

Future<List<McuRecommendation>?> getMcuRecommendation(int id) async {
  String url =
      AppEnvironment.serviceBaseUrl +
      ApiQueries.moviesDetailsQueryWithId(id: id);
  Uri uri = Uri.parse(url);
  List<McuRecommendation> mcuRecommendation = [];

  await http.get(uri).then((response) {
    try {
      if (response.statusCode == 200) {
        var res = mcuRecommendationFromJson(response.body);
        mcuRecommendation = res.relatedMovies!;
      }
    } catch (e) {
      debugPrint("EXCEPTION : $e");
    }
  });
  return mcuRecommendation;
}
