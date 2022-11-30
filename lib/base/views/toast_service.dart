import 'package:another_flushbar/flushbar.dart';
import 'package:base_flutter/tools/define/app_colors.dart';
import 'package:base_flutter/tools/define/app_fonts.dart';
import 'package:base_flutter/tools/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToastService {
  static showToast(BuildContext context, ToastType type, String mess, {String? title, Duration duration = const Duration(seconds: 3)}) {
    Flushbar(
      duration: duration,
      icon: SvgPicture.asset(getIconPath(type.icon), color: Colors.white, width: 20, height: 20),
      titleText: title == null ? null : Text(title, style: getTextStyle(AppFonts().heading2M, Colors.white)),
      messageText: Text(mess, style: getTextStyle(AppFonts().title, Colors.white)),
      backgroundColor: type.color,
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);
  }
}

enum ToastType {
  info,
  success,
  warning,
  error;

  String get icon {
    switch (this) {
      case ToastType.info:
        return "ic_info.svg";
      case ToastType.success:
        return "ic_success.svg";
      case ToastType.warning:
        return "ic_error.svg";
      case ToastType.error:
        return "ic_error.svg";
    }
  }

  Color get color {
    switch (this) {
      case ToastType.info:
        return AppColors().primary;
      case ToastType.success:
        return AppColors().active;
      case ToastType.warning:
        return AppColors().warning;
      case ToastType.error:
        return AppColors().danger;
    }
  }
}
