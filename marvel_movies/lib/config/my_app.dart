import 'package:flutter/material.dart';
import 'package:marvel_movies/core/theme/custom_theme_data.dart';
import 'package:provider/provider.dart';

import '../core/routes/generated_route.dart';
import '../core/routes/routes.dart';
import '../src/movies/presentation/provider/provider.dart';
import '../src/tv_shows/presentation/provider/tv_shows_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => McuDataProvider()),
        ChangeNotifierProvider(create: (context) => TvShowsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData.themeData,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
