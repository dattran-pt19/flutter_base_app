import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base/define/app_define.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (_) => page));
  }

  static void replaceBy(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (_) => page),
        (route) => false);
  }

  static void present(BuildContext context, Widget page) {
    Navigator.of(context)
        .push(CupertinoPageRoute(fullscreenDialog: true, builder: (_) => page));
  }

  static void presentBottomSheet(BuildContext context, Widget page) {
    showModalBottomSheet(
        context: context,
        builder: (_) => page,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(appPopupRadius),
                topRight: Radius.circular(appPopupRadius))),
        clipBehavior: Clip.hardEdge,
        useRootNavigator: false,
        isScrollControlled: true,
        isDismissible: true);
  }
}
