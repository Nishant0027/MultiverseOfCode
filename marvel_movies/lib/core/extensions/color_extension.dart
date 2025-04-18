import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withOpactityValue(double opacity) => withAlpha((opacity * 255).toInt());
}
