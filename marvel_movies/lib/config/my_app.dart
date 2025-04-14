import 'package:flutter/material.dart';
import 'package:marvel_movies/core/routes/routes.dart';
import 'package:marvel_movies/src/home/presentation/page/home_page.dart';
import 'package:marvel_movies/src/home/presentation/provider/provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => McuDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(secondary: Colors.transparent),
        ),
        routes: Routes.routes,
        home: const HomePage(),
      ),
    );
  }
}
