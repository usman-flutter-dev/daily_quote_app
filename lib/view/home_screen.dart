import 'package:daily_quote_app/utils/app_images.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:daily_quote_app/widgets/chips.dart';
import 'package:daily_quote_app/widgets/header.dart';
import 'package:daily_quote_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteController = Get.find<QuoteController>();
    // final nbController = Get.find<NavBarController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
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

                          SizedBox(
                            height: 150,
                            child: Obx(() {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: quoteController.quoteData.length,
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
                                          quoteController.quoteData[index].text
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

                          SizedBox(
                            height: 140,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: 5,
                                    right: 12,
                                    bottom: 10,
                                  ),
                                  // height: 137,
                                  width: 121,
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
                                );
                              },
                            ),
                          ),

                          Text(
                            'Daily Affirmation',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textMain,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            margin: EdgeInsets.only(top: 5, bottom: 10),
                            height: 137,
                            width: double.infinity,
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
                                  quoteController.quoteData[10].text.toString(),
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
                                    '_${quoteController.quoteData[120].from}',
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
