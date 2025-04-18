import 'package:flutter/material.dart';

import '../../src/home/presentation/page/home_screen.dart';
import '../../src/home/presentation/page/movie_details.dart';

class Routes {
  Routes._();
  static const homeScreen = '/';
  static const movieDetails = '/details';

  static final routes = <String, WidgetBuilder>{
    homeScreen: (context) => const HomeScreen(),
    movieDetails: (context) => const MoviesDetailsScreen(),
  };
}
