import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';

class Utilities {
  Utilities._();

  /// Compute duration from int to HH:mm format
  ///
  /// Exampe: 120 minutes = 2 Hrs 0 Mins
  static String computeDurationFromIntToHHmm(int? duration) {
    if (duration == null) {
      return "0";
    } else {
      return "${(duration ~/ 60)} Hrs ${(duration % 60)} Mins";
    }
  }

  /// Custom SnackBar to reuse in the app
  static void customSnackBar({
    required BuildContext context,
    required String content,
    required bool isSucess,
    Duration? snackBarDuration,
  }) {
    context.scaffoldMessenger
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: isSucess ? Colors.green : Colors.red,
          content: Text(content),
          duration: snackBarDuration ?? const Duration(seconds: 2),
        ),
      );
  }
}
