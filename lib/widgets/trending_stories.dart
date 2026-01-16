import 'package:daily_quote_app/utils/app_images.dart';
import 'package:daily_quote_app/utils/app_text.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/view/common_screen.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:daily_quote_app/widgets/glass_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingStories extends StatelessWidget {
  const TrendingStories({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteController = Get.find<QuoteController>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              AppText.trendingStories,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.textMain,
              ),
            ),
            GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                // Handle Here
                Get.to(
                  () => CommonScreen(),
                  arguments: AppText.trendingStories,
                );
              },
              child: Text(
                'view all',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),

        // --- Trending Stories Section ---
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: quoteController.quoteData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Get.to(
                  //   () => const QuoteDetailScreen(),
                  //   arguments: {
                  //     'text': quoteController
                  //         .quoteData[index]
                  //         .text,
                  //     'author': quoteController
                  //         .quoteData[index]
                  //         .from,
                  //     'bgImage':
                  //         AppImages.backgrounds[index],
                  //   },
                  //   transition: Transition.cupertino,
                  // );
                  Get.to(
                    () => CommonScreen(),
                    arguments: AppText.trendingStories,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 15.0,
                    top: 5,
                    bottom: 5,
                  ),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: Stack(
                      children: [
                        // 1. Image Background (Jo blur hogi)
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImages.backgrounds[index %
                                  AppImages.backgrounds.length],
                              fit: BoxFit.cover,
                              color: Colors.black.withValues(alpha: 0.3),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                        ),

                        // 2. Glass Tilt Card (Iska kaam sirf blur aur tilt dena hai)
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => CommonScreen(),
                              arguments: AppText.trendingStories,
                            );
                          },
                          child: GlassMorphicTiltCard(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    quoteController.quoteData[index].text
                                        .toString(),
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color: Colors.black45,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "- ${quoteController.quoteData[index].from}",
                                    style: GoogleFonts.roboto(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// PLANE UI NO GLASS EFFECT
                            // SizedBox(
                            //   height: 140,
                            //   child: Obx(() {
                            //     if (quoteController.quoteData.isEmpty) {
                            //       return const Center(
                            //         child: CircularProgressIndicator(),
                            //       );
                            //     }
                            //     return ListView.builder(
                            //       scrollDirection: Axis.horizontal,
                            //       itemCount:
                            //           quoteController.quoteData.length > 5
                            //           ? 5
                            //           : quoteController.quoteData.length,
                            //       itemBuilder: (context, index) {
                            //         return Container(
                            //           margin: EdgeInsets.only(
                            //             top: 5,
                            //             right: 12,
                            //             bottom: 10,
                            //           ),
                            //           // height: 137,
                            //           width: 121,
                            //           decoration: BoxDecoration(
                            //             image: DecorationImage(
                            //               image: AssetImage(
                            //                 AppImages.backgrounds[index %
                            //                     AppImages.backgrounds.length],
                            //               ),
                            //               fit: BoxFit.cover,
                            //               opacity: 0.6,
                            //               filterQuality: FilterQuality.low,
                            //             ),
                            //             color: Colors.black,
                            //             borderRadius: BorderRadius.circular(10),
                            //           ),
                            //         );
                            //       },
                            //     );
                            //   }),
                            // ),