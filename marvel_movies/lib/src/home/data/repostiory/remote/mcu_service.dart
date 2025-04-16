import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../config/environment_config.dart';
import '../../../../../core/constants/api_constants/api_queries.dart';
import '../../model/mcu_model.dart';

Future<List<Data>> getMcuData(BuildContext context) async {
  String url = AppEnvironment.serviceBaseUrl + ApiQueries.moviesListQuery();
  Uri uri = Uri.parse(url);
  List<Data> mcuModel = [
    Data(
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
    ),
  ];
  await http.get(uri).then((response) {
    try {
      if (response.statusCode == 200) {
        var res = mcuModelFromJson(response.body);
        mcuModel = res.data;
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Error: ${response.statusCode}: ${response.reasonPhrase}",
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("EXCEPTION : $e");
    }
  });
  return mcuModel;
}
