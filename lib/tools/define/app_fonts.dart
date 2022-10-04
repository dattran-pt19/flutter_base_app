import 'package:flutter/material.dart';

class AppFonts {
  static const roboto = "Roboto";
  static final _instance = AppFonts._();
  factory AppFonts() => _instance;
  AppFonts._();

  final heading1 = AppFontStyle.regular(28);
  final heading2 = AppFontStyle.regular(24);
  final heading3 = AppFontStyle.regular(20);
  final heading4 = AppFontStyle.regular(18);

  final body1 = AppFontStyle.regular(16);
  final body2 = AppFontStyle.regular(14);
  final body3 = AppFontStyle.regular(12);
  final body1M = AppFontStyle.medium(16);
  final body2M = AppFontStyle.medium(14);
  final body3M = AppFontStyle.medium(12);
  final body1B = AppFontStyle.bold(16);
  final body2B = AppFontStyle.bold(14);
  final body3B = AppFontStyle.bold(12);
}

class AppFontStyle {
  final FontWeight weight;
  final double size;

  const AppFontStyle({required this.weight, required this.size});

  factory AppFontStyle.medium(double size) {
    return AppFontStyle(weight: FontWeight.w500, size: size);
  }

  factory AppFontStyle.bold(double size) {
    return AppFontStyle(weight: FontWeight.bold, size: size);
  }

  factory AppFontStyle.regular(double size) {
    return AppFontStyle(weight: FontWeight.w300, size: size);
  }
}