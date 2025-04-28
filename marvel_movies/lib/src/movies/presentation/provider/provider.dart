import 'package:flutter/material.dart';

import '../../data/model/movie_details_model.dart';
import '../../data/model/movies_model.dart';
import '../../data/repostiory/mcu_service.dart';
import '../../data/repostiory/movie_details_repository.dart';

class McuDataProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  List<MoviesListData> _moviesList = [];

  List<MoviesListData> get moviesListData => _moviesList;
  setMoviesListData(List<MoviesListData> moviesList) {
    _moviesList = moviesList;
    notifyListeners();
  }

  Future getData(BuildContext context) async {
    setLoading(true);

    await fetchMoviesList(context).then((value) {
      // value
      //     .map(
      //       ((e) => DBHelper().insertData(
      //         DbModel(
      //           id: e.id,
      //           title: e.title,
      //           releaseDate: e.releaseDate,
      //           boxOffice: e.boxOffice,
      //           duration: e.duration,
      //           overview: e.overview,
      //           coverUrl: e.coverUrl,
      //           trailerUrl: e.trailerUrl,
      //           directedBy: e.directedBy,
      //           phase: e.phase,
      //           saga: e.saga,
      //           chronology: e.chronology,
      //           postCreditScenes: e.postCreditScenes,
      //           imdbId: e.imdbId,
      //         ),
      //       )),
      //     )
      //     .toList();

      // DBHelper().retriveData().then((value) {

      setLoading(false);
      setMoviesListData(value);
    });
    notifyListeners();
  }

  List<MovieDetailsModel> _movieDetails = [];
  List<MovieDetailsModel> get movieDetails => _movieDetails;

  setMovieDetails(List<MovieDetailsModel> mcuList) {
    _movieDetails = mcuList;
    notifyListeners();
  }

  bool _isMovieDetailsLoading = false;

  bool get isMovieDetailsLoading => _isMovieDetailsLoading;

  void setMovieDetailsLoading(bool isLoading) {
    _isMovieDetailsLoading = isLoading;
    notifyListeners();
  }

  Future<void> getRecent(int id) async {
    setMovieDetailsLoading(true);
    await fetchMovieDetails(id).then((value) {
      setMovieDetailsLoading(false);
      setMovieDetails(value);
    });
    notifyListeners();
  }
}
