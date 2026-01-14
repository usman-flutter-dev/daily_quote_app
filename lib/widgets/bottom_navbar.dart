import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/viewmodel/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final controller = Get.find<NavBarController>();

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.pages[controller.currentTabIndex.value],
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: .spaceAround,
            children: List.generate(controller.navBarIcons.length, (index) {
              final isSelected = index == controller.currentTabIndex.value;
              final icon = controller.navBarIcons[index];
              // If icon is null, it's the space for the FAB
              if (icon == null) return const SizedBox(width: 40);
              return GestureDetector(
                onTap: () {
                  controller.currentTabIndex.value = index;
                },
                child: Icon(
                  icon,
                  color: isSelected
                      ? AppColors.primaryOrange
                      : AppColors.black.withValues(alpha: 0.6),
                ),
              );
            }),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.onTabTapped(2),
          elevation: 0,
          backgroundColor: AppColors.primaryOrange,
          child: const Icon(Icons.add, size: 40, color: Colors.white),
        ),
      );
    });
  }
}
