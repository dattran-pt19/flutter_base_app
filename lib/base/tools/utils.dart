import 'package:flutter/material.dart';

import 'define/app_fonts.dart';

TextStyle getTextStyle(AppFontStyle font, Color color) {
  return TextStyle(fontFamily: AppFonts.roboto, fontSize: font.size, fontWeight: font.weight, color: color);
}

Widget getHorizontalSpacing(double spacing) {
  return SizedBox(width: spacing,);
}

Widget getVerticalSpacing(double spacing) {
  return SizedBox(height: spacing,);
}

String getIconPath(String iconName) {
  return "assets/icons/$iconName";
}