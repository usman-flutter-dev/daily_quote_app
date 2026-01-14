import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/widgets/header.dart';
import 'package:daily_quote_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final qController = Get.find<QuoteController>();
    // final nbController = Get.find<NavBarController>();

    return Scaffold(
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

                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          height: 137,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                            itemCount: 4,
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
                                  color: Colors.amber,
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
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          height: 137,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
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
  }
}
