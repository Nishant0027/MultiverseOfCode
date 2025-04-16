extension StringExtension on String {
  /// Converts a string to a DateTime object.
  DateTime parseStringtoDate() {
    return DateTime.parse(this);
  }
}
