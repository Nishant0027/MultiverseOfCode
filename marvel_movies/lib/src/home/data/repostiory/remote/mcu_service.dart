import 'package:flutter/material.dart';

import '../../../../../config/environment_config.dart';
import '../../../../../core/constants/api_constants/api_queries.dart';
import '../../../../../core/service/api_service.dart';
import '../../model/mcu_model.dart';

Future<List<Data>> getMcuData(BuildContext context) async {
  String url = AppEnvironment.serviceBaseUrl + ApiQueries.moviesListQuery();
  List<Data> mcuModel = [];

  await ApiService.getService(url: url).then((response) {
    try {
      if (response != null && response.statusCode == 200) {
        var res = McuModel.fromJson(response.data);
        mcuModel = res.data;
      }
    } catch (e) {
      debugPrint("EXCEPTION : $e");
    }
  });
  return mcuModel;
}
