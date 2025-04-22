import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../movies/presentation/provider/provider.dart';
import '../../../movies/presentation/screen/movies_list_screen.dart';
import '../../../tv_shows/presentation/screen/tv_show_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      body:
      // Provider.of<McuDataProvider>(context).isLoading == true
      //     ? const Center(child: CustomCircularIndicator())
      //     : const MovieGrid(),
      SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                indicatorAnimation: TabIndicatorAnimation.elastic,
                tabs: [
                  Tab(
                    icon: const Icon(Icons.movie_creation_outlined),
                    text: 'Movies',
                  ),
                  Tab(icon: const Icon(Icons.tv), text: 'TV Shows'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [MoviesListScreen(), TvShowScreen()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
