import 'package:flutter/material.dart';

import '../../../tools/utils.dart';
import '../../define/app_colors.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator(
      {super.key,
      required this.itemCount,
      required this.currentIndex,
      this.highlightColor,
      this.defaultColor});

  static const double height = 6;
  final int itemCount;
  final ValueNotifier<int> currentIndex;
  final Color? highlightColor;
  final Color? defaultColor;

  List<Widget> getListIndicator() {
    List<Widget> listWidget = [];
    for (var i = 0; i < itemCount; i++) {
      listWidget.add(Expanded(
          child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            color: currentIndex.value == i
                ? highlightColor ?? AppColors().primary
                : defaultColor ?? AppColors().border,
            borderRadius: BorderRadius.circular(height / 2)),
      )));
      if (i < itemCount - 1) {
        listWidget.add(getHorizontalSpacing(6));
      }
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: currentIndex,
        builder: (_, child) => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: getListIndicator(),
            ));
  }
}
