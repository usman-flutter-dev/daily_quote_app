import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final controller = Get.put(QuoteController());

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          // Adjust logic if you use 4 items instead of 5
          controller.changeTab(index);
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          // Create a dummy item or a gap for the center button
          BottomNavigationBarItem(icon: SizedBox(width: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }
}
