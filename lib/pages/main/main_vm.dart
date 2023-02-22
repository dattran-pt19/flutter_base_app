import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../base/mvvm/base_view_model.dart';

enum AppTabBarType {
  home;

  String get icon {
    switch (this) {
      case AppTabBarType.home:
        return "ic_home.svg";
    }
  }

  String get title {
    switch (this) {
      case AppTabBarType.home:
        return "home".tr();
    }
  }

  Widget get view {
    switch (this) {
      case AppTabBarType.home:
        return const Center(
          child: Text("Hello base app"),
        );
    }
  }
}

class MainVM extends BaseViewModel {
  final List<AppTabBarType> listTabBar = AppTabBarType.values;
  static const double ticketViewHeight = 64;
  static const double ticketButtonHeight = 50;
  int selectedIndex = 0;
  int animateCount = 0;

  bool checkIsSelectedItem(AppTabBarType type) {
    final selectedType = listTabBar[selectedIndex];
    return selectedType == type;
  }
}