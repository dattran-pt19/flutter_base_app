import 'package:base_flutter/base/mvvm/base_view.dart';
import 'package:base_flutter/views/main/main_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../tools/define/app_colors.dart';
import '../../tools/define/app_fonts.dart';
import '../../tools/singleton.dart';
import '../../tools/utils.dart';

class MainView extends BaseView {
  const MainView({super.key});

  @override
  State<StatefulWidget> createState() => _MainViewState.create();
}

class _MainViewState extends ViewState<MainView, MainVM> {
  _MainViewState(super.viewModel);

  factory _MainViewState.create() {
    return _MainViewState(MainVM());
  }

  void _onTabBarTap(AppTabBarType type) {
    final selectedIndex = viewModel.listTabBar.indexOf(type);
    setState(() {
      viewModel.selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      body: IndexedStack(
        index: viewModel.selectedIndex,
        children: viewModel.listTabBar.map((e) => e.view).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 2,
        shape: const CircularNotchedRectangle(),
        notchMargin: 1,
        child: SizedBox(
          height: 54,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: viewModel.listTabBar
                .map((type) => Expanded(
              child: GestureDetector(
                onTap: () {
                  _onTabBarTap(type);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(appRadius)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        getIconPath(type.icon),
                        color: viewModel.checkIsSelectedItem(type)
                            ? AppColors().primary
                            : AppColors().dark,
                      ),
                      getVerticalSpacing(2),
                      Text(type.title,
                          style: getTextStyle(
                              AppFonts().body1,
                              viewModel.checkIsSelectedItem(type)
                                  ? AppColors().primary
                                  : AppColors().dark))
                    ],
                  ),
                ),
              ),
            ))
                .toList(),
          ),
        ),
      )
    );
  }

}