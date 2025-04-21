extension NullableIntExtension on int? {
  /// Checks if the integer is null or empty.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// int? myInt;
  /// if (myInt.isNullOrEmpty()) {
  ///   print("Integer is null or empty");
  /// } else {
  ///   print("Integer is not null or empty");
  /// }
  /// ```
  bool isNullOrEmpty() {
    if (this == null || this == 0) {
      return true;
    } else {
      return false;
    }
  }
}
