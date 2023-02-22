import 'package:base_flutter/base/views/story_indicator/story_item.dart';
import 'package:flutter/material.dart';

import '../../../tools/utils.dart';

class StoryIndicator extends StatefulWidget {
  const StoryIndicator(
      {super.key,
      required this.itemCount,
      required this.currentIndex,
      this.highlightColor,
      this.defaultColor,
      this.interval = const Duration(seconds: 4)});

  final int itemCount;
  final ValueNotifier<int> currentIndex;
  final Duration interval;
  final Color? highlightColor;
  final Color? defaultColor;

  @override
  State<StatefulWidget> createState() => _StoryIndicatorState();
}

class _StoryIndicatorState extends State<StoryIndicator> {
  List<Widget> getListIndicator() {
    List<Widget> listWidget = [];
    for (var i = 0; i < widget.itemCount; i++) {
      listWidget.add(Expanded(
          child: StoryItem(
        interval: widget.interval,
        isSelected: i == widget.currentIndex.value,
        highlightColor: widget.highlightColor,
        defaultColor: widget.defaultColor,
        onComplete: _next,
        isFill: i < widget.currentIndex.value,
      )));
      if (i < widget.itemCount - 1) {
        listWidget.add(getHorizontalSpacing(6));
      }
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.currentIndex,
        builder: (_, child) => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: getListIndicator(),
            ));
  }

  void _next() {
    if (widget.currentIndex.value == widget.itemCount - 1) {
      widget.currentIndex.value = 0;
    } else {
      widget.currentIndex.value += 1;
    }
  }
}
