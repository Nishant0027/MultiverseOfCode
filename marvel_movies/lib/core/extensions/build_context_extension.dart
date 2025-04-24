import 'package:flutter/material.dart';

/// This extension provides a convenient way to access various Flutter widgets and properties
/// directly from the BuildContext, making the code cleaner and more readable.
/// It allows you to access the following:
/// - Navigator
/// - Theme
/// - MediaQuery
/// - ScaffoldMessenger
/// - Size
/// etc.
extension BuildContextExtension on BuildContext {
  /// Access the Navigator state for the current context.
  ///
  /// This allows you to perform navigation operations such as pushing or popping routes.
  ///
  /// Example usage:
  /// ```dart
  /// context.navigator.pushNamed('/newRoute');
  /// ```
  NavigatorState get navigator => Navigator.of(this);

  /// Access the Theme data for the current context.
  ///
  /// This allows you to access theme properties such as colors, text styles, etc.
  ///
  /// Example usage:
  /// ```dart
  /// final primaryColor = context.theme.primaryColor;
  /// ```
  ThemeData get theme => Theme.of(this);

  /// Access the MediaQuery data for the current context.
  ///
  /// This provides information about the size, orientation, and other properties of the screen.
  ///
  /// This is a more verbose way to access the MediaQuery data.
  /// Before using this extension, you might have used:
  /// ```dart
  /// final mediaQueryData = MediaQuery.of(context);
  /// final screenSize = mediaQueryData.size;
  /// final screenOrientation = mediaQueryData.orientation;
  /// ```
  /// This is a more concise way to access the MediaQuery data.
  ///
  /// After using this extension, you can simply do:
  /// ```dart
  /// final screenSize = context.mediaQuery.size;
  /// final screenOrientation = context.mediaQuery.orientation;
  /// ```
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Access the MediaQuery size for the current context.
  ///
  /// This provides the size of the screen, which can be useful for responsive design.
  ///
  /// Example usage:
  /// ```dart
  /// final screenWidth = context.mediaQuery.size.width;
  /// ```
  Size get mediaQuerySizeOf => MediaQuery.sizeOf(this);

  /// Access the ScaffoldMessenger state for the current context.
  ///
  /// This allows you to show SnackBars, BottomSheets, and other scaffold-related operations.
  ///
  /// Example usage:
  /// ```dart
  /// context.scaffoldMessenger.showSnackBar(
  ///   SnackBar(content: Text('Hello, World!')),
  /// );
  /// ```
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
