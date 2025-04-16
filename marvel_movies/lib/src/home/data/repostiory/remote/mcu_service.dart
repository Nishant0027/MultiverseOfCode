import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/mcu_model.dart';

Future<List<Data>> getMcuData() async {
  String url = "https://mcuapi.herokuapp.com/api/v1/movies";
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
      }
    } catch (e) {
      debugPrint("EXCEPTION : $e");
    }
  });
  return mcuModel;
}
