import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants/app_constants.dart';
import '../../../../core/widgets/custom_circular_indicator.dart';
import '../provider/provider.dart';
import 'movie_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: AppConstants.backgroundGrey,
      body:
          Provider.of<McuDataProvider>(context).isLoading == true
              ? const Center(child: CustomCircularIndicator())
              : const MovieGrid(),
    );
  }
}
