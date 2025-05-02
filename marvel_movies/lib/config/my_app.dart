import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/routes/generated_route.dart';
import '../core/routes/routes.dart';
import '../core/service/navigation_service.dart';
import '../core/theme/custom_theme_data.dart';
import '../src/movies/presentation/provider/provider.dart';
import '../src/tv_shows/tv_show_listing/presentation/provider/tv_shows_provider.dart';

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
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData.themeData,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
