import 'package:daily_quote_app/utils/app_images.dart';
import 'package:daily_quote_app/utils/app_text.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/view/common_screen.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyAffirmation extends StatelessWidget {
  const DailyAffirmation({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteController = Get.find<QuoteController>();

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          AppText.dailyAffirmation,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.textMain,
          ),
        ),

        // --- Daily Affirmation Section ---
        SizedBox(
          height: 140,
          child: Obx(() {
            if (quoteController.quoteData.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: quoteController.quoteData.length > 15
                  ? 1
                  : quoteController.quoteData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final quote = quoteController.quoteData[14];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => CommonScreen(),
                      arguments: AppText.dailyAffirmation,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    // height: 137,
                    width: 325,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.backgrounds[3]),
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
                          quote.text.toString(),
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
                            '_${quote.from}',
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
