import 'package:flutter/material.dart';
import 'package:marvel_movies/src/home/data/repostiory/local/database/database_helper.dart';
import 'package:marvel_movies/src/home/data/repostiory/local/database/database_model.dart';
import 'package:marvel_movies/src/home/data/repostiory/remote/mcu_service.dart';

import '../../data/model/mcu_model.dart';
import '../../data/model/mcu_recommendation_model.dart';
import '../../data/repostiory/remote/mcu_recommend_service.dart';

class McuDataProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  List<Data> _mcuModelData = [];

  List<Data> get mcuModel => _mcuModelData;
  setMcuModelData(List<Data> mcuModel) {
    _mcuModelData = mcuModel;
    notifyListeners();
  }

  Future getData() async {
    setLoading(true);

    await getMcuData().then((value) {
      value
          .map(
            ((e) => DBHelper().insertData(
              DbModel(
                id: e.id,
                title: e.title,
                releaseDate: e.releaseDate,
                boxOffice: e.boxOffice,
                duration: e.duration,
                overview: e.overview,
                coverUrl: e.coverUrl,
                trailerUrl: e.trailerUrl,
                directedBy: e.directedBy,
                phase: e.phase,
                saga: e.saga,
                chronology: e.chronology,
                postCreditScenes: e.postCreditScenes,
                imdbId: e.imdbId,
              ),
            )),
          )
          .toList();

      DBHelper().retriveData().then((value) {
        if (value != null) {
          setLoading(false);

          setMcuModelData(
            value
                .map(
                  (e) => Data(
                    id: e.id,
                    title: e.title,
                    releaseDate: e.releaseDate,
                    boxOffice: e.boxOffice,
                    duration: e.duration,
                    overview: e.overview,
                    coverUrl: e.coverUrl,
                    trailerUrl: e.trailerUrl,
                    directedBy: e.directedBy,
                    phase: e.phase,
                    saga: e.saga,
                    chronology: e.chronology,
                    postCreditScenes: e.postCreditScenes,
                    imdbId: e.imdbId,
                  ),
                )
                .toList(),
          );
        }
      });
    });
    notifyListeners();
  }

  List<McuRecommendation> _mcuRecommendation = [];
  List<McuRecommendation> get mcuRecommendation => _mcuRecommendation;

  setMcuRecommendation(List<McuRecommendation> mcuList) {
    _mcuRecommendation = mcuList;
    notifyListeners();
  }

  bool _isListLoading = false;

  bool get isListLoading => _isListLoading;

  void setListLoading(bool isListLoading) {
    _isListLoading = isListLoading;
    notifyListeners();
  }

  Future<void> getRecent(int id) async {
    setListLoading(true);
    await getMcuRecommendation(id).then((value) {
      setListLoading(false);
      if (value != null) {
        setMcuRecommendation(value);
      }
    });
    notifyListeners();
  }
}
