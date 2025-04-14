import 'package:flutter/material.dart';

import '../../src/home/presentation/page/movie_details.dart';

class Routes {
  Routes._();
  static const movieDetails = '/details';

  static final routes = <String, WidgetBuilder>{
    movieDetails: (context) => const MoviesDetailsScreen(),
  };
}
