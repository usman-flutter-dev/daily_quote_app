import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_quote_app/view/favorite_page.dart';
import 'package:daily_quote_app/view/home_screen.dart';
import 'package:daily_quote_app/view/setting_screen.dart';
import 'package:daily_quote_app/view/statistics_page.dart';

class NavBarController extends GetxController {
  RxInt currentTabIndex = 0.obs;

  void onTabTapped(int index) {
    currentTabIndex.value = index;
  }

  // NavBar Controller
  // Inside your Main Screen or wherever you display the body
  final List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const Text('Hi'),
    const StatisticsScreen(),
    const SettingScreen(),
  ];

  final List<IconData?> navBarIcons = const [
    //
    Icons.home,
    Icons.favorite_border,
    null,
    Icons.bar_chart,
    Icons.settings,
  ];
}
