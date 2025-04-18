import 'package:flutter/material.dart';

import 'environment_config.dart';
import 'my_app.dart';

void main() async {
  AppEnvironment.setupEnvironment(Environment.uat);

  runApp(const MyApp());
}
