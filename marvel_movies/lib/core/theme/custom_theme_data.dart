import 'package:flutter/material.dart';

import '../constants/app_constants/app_constants.dart';

/// This class contains the custom theme data for the application.
class CustomThemeData {
  CustomThemeData._();

  /// Theme Data for the application
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppConstants.backgroundGrey,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppConstants.backgroundGrey,
      titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      scrolledUnderElevation: 0,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.indigo,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(secondary: Colors.transparent),
  );
}
