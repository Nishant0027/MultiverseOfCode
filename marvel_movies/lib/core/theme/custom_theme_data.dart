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
      splashFactory: NoSplash.splashFactory,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorAnimation: TabIndicatorAnimation.elastic,
      indicator: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 88, 89, 90),
            const Color.fromARGB(255, 50, 52, 68),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        // Use the default focused overlay color
        return states.contains(WidgetState.focused) ? null : Colors.transparent;
      }),
      dividerHeight: 0,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(secondary: Colors.transparent),
  );
}
