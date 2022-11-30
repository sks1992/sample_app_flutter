import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sample_app/ui/screen/notes_screen.dart';
import 'package:sample_app/ui/screen/news_screen.dart';
import 'package:sample_app/ui/screen/search_screen.dart';

import '../../core/controller/dashboard_bottombar_controller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardBottomBarController>(
      init: Get.put(DashboardBottomBarController()),
      builder: (DashboardBottomBarController tabController) {
        return PersistentTabView(
          context,
          screens: _screens(),
          controller: tabController.tabController,
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          decoration: NavBarDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 0.5,
            ),
          ]),
          navBarStyle: NavBarStyle.style13,
        );
      },
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard_outlined),
        title: ("Notes"),
        activeColorPrimary: Colors.lightBlueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.newspaper),
        title: ("News"),
        activeColorPrimary: Colors.lightBlueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("search"),
        activeColorPrimary: Colors.lightBlueAccent,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  List<Widget> _screens() {
    return [NotesScreen(), NewsScreen(), SearchScreen()];
  }
}
