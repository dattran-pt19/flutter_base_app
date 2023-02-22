import 'package:flutter/material.dart';

import '../base/define/app_fonts.dart';

TextStyle getTextStyle(AppFontStyle font, Color color, {String fontFamily = AppFonts.roboto}) {
  return TextStyle(fontFamily: fontFamily, fontSize: font.size, fontWeight: font.weight, color: color);
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

double getBottomSafeArea(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}

double getTopSafeArea(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}