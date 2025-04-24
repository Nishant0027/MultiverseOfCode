import 'package:flutter/material.dart';
import 'package:marvel_movies/src/tv_shows/data/model/tv_show_list_model.dart';
import 'package:marvel_movies/src/tv_shows/data/repository/tv_show_repository.dart';

class TvShowsProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  List<TvShowData> _tvShowModelData = [];

  List<TvShowData> get tvShowModel => _tvShowModelData;
  setTvShowData(List<TvShowData> data) {
    _tvShowModelData = data;
    notifyListeners();
  }

  Future getData(BuildContext context) async {
    setLoading(true);

    await TvShowsRepository.fetchTvShowList().then((value) {
      setLoading(false);
      setTvShowData(value?.data ?? []);
    });
    notifyListeners();
  }
}
