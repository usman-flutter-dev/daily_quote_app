import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:daily_quote_app/widgets/chips.dart';
import 'package:daily_quote_app/widgets/daily_affirmation.dart';
import 'package:daily_quote_app/widgets/daily_challange.dart';
import 'package:daily_quote_app/widgets/header.dart';
import 'package:daily_quote_app/widgets/search.dart';
import 'package:daily_quote_app/widgets/trending_stories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteController = Get.find<QuoteController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Obx(() {
          if (quoteController.isLoading.value) {
            Future.delayed(Duration(seconds: 3));
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
                            DailyChallange(),
                            TrendingStories(),
                            DailyAffirmation(),
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
