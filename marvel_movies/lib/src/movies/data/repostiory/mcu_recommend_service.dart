import 'package:flutter/material.dart';

import '../../../../config/environment_config.dart';
import '../../../../core/constants/api_constants/api_queries.dart';
import '../../../../core/service/api_service.dart';
import '../model/mcu_recommendation_model.dart';

Future<List<McuRecommendation>?> getMcuRecommendation(int id) async {
  String url =
      AppEnvironment.serviceBaseUrl +
      ApiQueries.moviesDetailsQueryWithId(id: id);
  List<McuRecommendation> mcuRecommendation = [];
  await ApiService.getService(url: url).then((response) {
    try {
      if (response != null && response.statusCode == 200) {
        var res = McuRecommendation.fromJson(response.data);
        mcuRecommendation = res.relatedMovies!;
      }
    } catch (e) {
      debugPrint("EXCEPTION : $e");
    }
  });
  return mcuRecommendation;
}
