extension StringExtension on String {
  /// Converts a string to a DateTime object.
  DateTime parseStringtoDate() {
    return DateTime.parse(this);
  }

  bool isNullOrEmpty() {
    if (isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

/// Extension to check if a string is null or empty
///
/// It returns true if the string is null or empty, and false otherwise.
///
/// Example usage:
///
/// ```dart
/// String? myString;
/// if (myString.isNullOrEmpty()) {
///   print("String is null or empty");
/// } else {
///   print("String is not null or empty");
/// }
/// }
extension NullableStringExtension on String? {
  bool isNullOrEmpty() {
    if (this?.isEmpty ?? true) {
      return true;
    } else {
      return false;
    }
  }
}
