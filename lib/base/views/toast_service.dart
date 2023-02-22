import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../tools/utils.dart';
import '../define/app_colors.dart';
import '../define/app_fonts.dart';

class ToastService {
  static void showToast(BuildContext context,
      {ToastType type = ToastType.success,
      String? mess,
      Duration duration = const Duration(seconds: 3)}) {
    Flushbar(
      duration: duration,
      icon: IconButton(
          icon: const Icon(Icons.close, size: 20, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          }),
      titleText: mess == null
          ? null
          : Text(type.title,
              style: getTextStyle(AppFonts().heading2M, Colors.white)),
      messageText: Text(mess ?? type.title,
          style: getTextStyle(
              mess == null ? AppFonts().heading2M : AppFonts().title,
              Colors.white)),
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

  String get title {
    switch (this) {
      case ToastType.info:
        return "toast.info".tr();
      case ToastType.success:
        return "toast.success".tr();
      case ToastType.warning:
        return "toast.warning".tr();
      case ToastType.error:
        return "toast.error".tr();
    }
  }
}
