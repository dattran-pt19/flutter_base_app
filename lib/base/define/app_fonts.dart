import 'package:flutter/material.dart';

class AppFonts {
  static const roboto = "Roboto";
  static final _instance = AppFonts._();
  factory AppFonts() => _instance;
  AppFonts._();

  final heading1 = AppFontStyle.regular(20);
  final heading2 = AppFontStyle.regular(18);
  final title = AppFontStyle.regular(16);
  final body = AppFontStyle.regular(14);
  final description = AppFontStyle.regular(12);

  final heading1M = AppFontStyle.medium(20);
  final heading2M = AppFontStyle.medium(18);
  final titleM = AppFontStyle.medium(16);
  final bodyM = AppFontStyle.medium(14);
  final descriptionM = AppFontStyle.medium(12);

  final heading1B = AppFontStyle.bold(20);
  final heading2B = AppFontStyle.bold(18);
  final titleB = AppFontStyle.bold(16);
  final bodyB = AppFontStyle.bold(14);
  final descriptionB = AppFontStyle.bold(12);
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