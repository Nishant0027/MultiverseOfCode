class Utilities {
  Utilities._();

  /// Compute duration from int to HH:mm format
  ///
  /// Exampe: 120 minutes = 2 Hrs 0 Mins
  static String computeDurationFromIntToHHmm(int duration) =>
      "${(duration ~/ 60)} Hrs ${(duration % 60)} Mins";
}
