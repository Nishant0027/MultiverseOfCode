import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  /// Return Date in format dd, MMM yyyy
  String formatddMMMyyyy() {
    return DateFormat('dd, MMM yyyy').format(this);
  }
}
