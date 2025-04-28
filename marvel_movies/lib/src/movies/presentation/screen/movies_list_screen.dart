import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widget/movie_grid.dart';
import '../widget/movies_list_skeleton_loader.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // Provider.of<McuDataProvider>(context, listen: false).setLoading(true);
      if (mounted) {
        Provider.of<McuDataProvider>(context, listen: false).getData(context);
      }
      // .then(
      //     (value) => Provider.of<McuDataProvider>(context, listen: false)
      //         .setLoading(false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Provider.of<McuDataProvider>(context).isLoading == true
              ? MoviesListSkeletonLoader()
              : MovieGrid(),
    );
  }
}
