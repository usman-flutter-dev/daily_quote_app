import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/viewmodel/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarPackage extends StatefulWidget {
  const BottomNavBarPackage({super.key});

  @override
  State<BottomNavBarPackage> createState() => _BottomNavBarPackageState();
}

class _BottomNavBarPackageState extends State<BottomNavBarPackage> {
  /// Controller ko build method se bahar rakhein
  final _pageController = PageController(initialPage: 0);
  final _notchController = NotchBottomBarController(index: 0);
  final controller = Get.find<NavBarController>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.pages,
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _notchController,
        color: Colors.white,
        showLabel: true,
        notchColor: AppColors.primaryOrange,
        removeMargins: false,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_filled, color: Colors.blueGrey),
            activeItem: Icon(Icons.home_filled, color: AppColors.surfaceGhost),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.favorite_border, color: Colors.blueGrey),
            activeItem: Icon(Icons.favorite, color: AppColors.surfaceGhost),
            itemLabel: 'Fav',
          ),
          // BottomBarItem(
          //   inActiveItem: Icon(Icons.bar_chart, color: Colors.blueGrey),
          //   activeItem: Icon(Icons.bar_chart, color: AppColors.surfaceGhost),
          //   itemLabel: 'Stats',
          // ),
          BottomBarItem(
            inActiveItem: Icon(Icons.settings, color: Colors.blueGrey),
            activeItem: Icon(Icons.settings, color: AppColors.surfaceGhost),
            itemLabel: 'Settings',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
        kBottomRadius: 28.0,
      ),
    );
  }
}
