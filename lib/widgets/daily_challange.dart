import 'package:daily_quote_app/utils/app_images.dart';
import 'package:daily_quote_app/utils/app_text.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/view/common_screen.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyChallange extends StatelessWidget {
  const DailyChallange({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteController = Get.find<QuoteController>();

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          AppText.dailyChallenge,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.textMain,
          ),
        ),

        // --- Daily Challenge Section ---
        SizedBox(
          height: 150,
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: quoteController.quoteData.length > 10
                  ? 10
                  : quoteController.quoteData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    Get.to(
                      () => CommonScreen(),
                      arguments: AppText.dailyChallenge,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    margin: EdgeInsets.only(top: 5, bottom: 10, right: 10),
                    height: 137,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.backgrounds[index %
                              AppImages.backgrounds.length],
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.6,
                        filterQuality: FilterQuality.low,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          quoteController.quoteData[index].text.toString(),
                          style: GoogleFonts.aboreto(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '_${quoteController.quoteData[index].from}',
                            style: GoogleFonts.akronim(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
