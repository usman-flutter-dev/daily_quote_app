import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chips extends StatelessWidget {
  const Chips({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuoteController>();
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.chips.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected = controller.selectedChipIndex.value == index;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ChoiceChip(
                label: Text(
                  controller.chips[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                selected: isSelected,
                selectedColor: AppColors.energeticCoral,
                backgroundColor: Colors.grey[200],
                onSelected: (bool selected) {
                  if (selected) {
                    controller.updateSelectedChip(index);
                  }
                },
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
