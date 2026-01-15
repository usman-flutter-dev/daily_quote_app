import 'package:daily_quote_app/sharing/quote_detail_screen.dart';
import 'package:daily_quote_app/utils/app_images.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:daily_quote_app/widgets/chips.dart';
import 'package:daily_quote_app/widgets/glass_card.dart';
import 'package:daily_quote_app/widgets/header.dart';
import 'package:daily_quote_app/widgets/neumorphic_card.dart';
import 'package:daily_quote_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteController = Get.find<QuoteController>();
    // final nbController = Get.find<NavBarController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Obx(() {
          if (quoteController.isLoading.value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Aapka Custom Loader (Yahan Lottie animation bhi laga sakte hain)
                  LoadingAnimationWidget.halfTriangleDot(
                    color: AppColors.primaryOrange,
                    size: 40,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Fetching Quotes...",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          return SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 28, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  /// Header
                  Header(),
                  const SizedBox(height: 16),

                  /// Search
                  Search(),
                  const SizedBox(height: 15),

                  const Chips(),

                  // Chip(label: Text('I am Chip')),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Daily Challenge',
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
                                  itemCount:
                                      quoteController.quoteData.length > 10
                                      ? 10
                                      : quoteController.quoteData.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 15,
                                      ),
                                      margin: EdgeInsets.only(
                                        top: 5,
                                        bottom: 10,
                                        right: 10,
                                      ),
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
                                            quoteController
                                                .quoteData[index]
                                                .text
                                                .toString(),
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
                                    );
                                  },
                                );
                              }),
                            ),

                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  'Trending Stories',
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
                                      Get.to(
                                        () => const QuoteDetailScreen(),
                                        arguments: {
                                          'text': quoteController
                                              .quoteData[index]
                                              .text,
                                          'author': quoteController
                                              .quoteData[index]
                                              .from,
                                          'bgImage':
                                              AppImages.backgrounds[index],
                                        },
                                        transition: Transition.cupertino,
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  AppImages.backgrounds[index %
                                                      AppImages
                                                          .backgrounds
                                                          .length],
                                                  fit: BoxFit.cover,
                                                  color: Colors.black
                                                      .withValues(alpha: 0.3),
                                                  colorBlendMode:
                                                      BlendMode.darken,
                                                ),
                                              ),
                                            ),

                                            // 2. Glass Tilt Card (Iska kaam sirf blur aur tilt dena hai)
                                            GlassMorphicTiltCard(
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      quoteController
                                                          .quoteData[index]
                                                          .text
                                                          .toString(),
                                                      maxLines: 6,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        shadows: [
                                                          Shadow(
                                                            blurRadius: 10,
                                                            color:
                                                                Colors.black45,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

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
                            Text(
                              'Daily Affirmation',
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
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return ListView.builder(
                                  itemCount:
                                      quoteController.quoteData.length > 15
                                      ? 1
                                      : quoteController.quoteData.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final quote = quoteController.quoteData[14];
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 15,
                                      ),
                                      margin: EdgeInsets.only(
                                        top: 5,
                                        bottom: 10,
                                      ),
                                      // height: 137,
                                      width: 325,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            AppImages.backgrounds[3],
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
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
