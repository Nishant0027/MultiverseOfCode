import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants/app_constants.dart';

class TvShowScreen extends StatelessWidget {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.backgroundGrey,
        title: Text("TV Shows", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
