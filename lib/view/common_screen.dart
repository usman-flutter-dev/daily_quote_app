import 'package:daily_quote_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final quoteController = Get.find<QuoteController>();
    final String title = Get.arguments ?? 'Quotes';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(AppImages.womanImage, fit: BoxFit.cover),
            ),
            pinned: true,
            backgroundColor: Colors.black87,
            title: Text(
              title,
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            expandedHeight: 250,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),

                  child: Image.asset(
                    AppImages.backgrounds[index],
                    fit: BoxFit.cover,
                    height: 400,
                  ),
                ),
              ),
              childCount: AppImages.backgrounds.length,
            ),
          ),
        ],
      ),
    );
  }
}
