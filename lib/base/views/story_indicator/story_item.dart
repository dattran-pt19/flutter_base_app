import 'package:flutter/material.dart';

class StoryItem extends StatefulWidget {
  const StoryItem(
      {super.key,
      required this.interval,
      this.isSelected = false,
      this.onComplete,
      required this.isFill,
      this.highlightColor,
      this.defaultColor});

  final Duration interval;
  final bool isSelected;
  final bool isFill;
  final Color? highlightColor;
  final Color? defaultColor;
  final VoidCallback? onComplete;

  @override
  State<StatefulWidget> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> with TickerProviderStateMixin {
  final double height = 6;
  late AnimationController _progressAnimationController;
  late Animation _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressAnimationController =
        AnimationController(vsync: this, duration: widget.interval);
    _progressAnimation =
        Tween<double>(begin: 0, end: 1).animate(_progressAnimationController);
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected) {
      _progressAnimationController.forward();
    } else {
      _progressAnimationController.reset();
    }

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          color: widget.defaultColor ?? Colors.white.withAlpha(30),
          borderRadius: BorderRadius.circular(height / 2)),
      child: AnimatedBuilder(
        animation: _progressAnimationController,
        builder: (_, child) => FractionallySizedBox(
          alignment: Alignment.centerLeft,
          heightFactor: 1,
          widthFactor: widget.isFill ? 1 : _progressAnimation.value,
          child: GestureDetector(
              onTap: () {
                if (_progressAnimationController.isAnimating) {
                  _progressAnimationController.stop();
                } else {
                  _progressAnimationController.forward();
                }
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: widget.highlightColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(height / 2)),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    super.dispose();
  }
}
