import 'package:flutter/material.dart';

import '../../src/home/presentation/screen/home_screen.dart';
import '../../src/movies/data/model/mcu_model.dart';
import '../../src/movies/presentation/screen/movie_details.dart';
import '../../src/tv_shows/data/model/tv_show_list_model.dart';
import '../../src/tv_shows/tv_show_detail/presentation/screen/tv_show_detail_screen.dart';
import 'page_routing_error_widget.dart';
import 'routes.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: settings,
      );
    case Routes.movieDetails:
      final moviesData = settings.arguments as Data;
      return MaterialPageRoute(
        builder: (_) => MoviesDetailsScreen(moviesData: moviesData),
        settings: settings,
      );
    case Routes.tvShowsDetails:
      final tvshowData = settings.arguments as TvShowData;
      return MaterialPageRoute(
        builder: (_) => TvShowDetailScreen(tvShowData: tvshowData),
        settings: settings,
      );
    default:
      _errorRoute();
  }
  return _errorRoute();
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) => PageRoutingErrorWidget());
}
