import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_constants/app_constants.dart';
import '../core/routes/routes.dart';
import '../src/movies/presentation/provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => McuDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppConstants.backgroundGrey,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          tabBarTheme: TabBarThemeData(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.indigo,
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(secondary: Colors.transparent),
        ),
        routes: Routes.routes,
      ),
    );
  }
}
