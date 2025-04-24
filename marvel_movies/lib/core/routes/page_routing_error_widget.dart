import 'package:flutter/material.dart';

import '../constants/app_constants/app_constants.dart';

class PageRoutingErrorWidget extends StatelessWidget {
  const PageRoutingErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error', style: TextStyle(color: Colors.white)),
        backgroundColor: AppConstants.backgroundGrey,
      ),
      body: const Center(
        child: Text(
          'Oops!! the page you are looking for is not here.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
