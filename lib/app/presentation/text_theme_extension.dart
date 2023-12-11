import 'package:flutter/material.dart';

extension CustomStyles on TextTheme {
  TextStyle get titleLarge => const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );

  TextStyle get title => const TextStyle(fontSize: 16);
}

extension BuiltContextShortCuts on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
}