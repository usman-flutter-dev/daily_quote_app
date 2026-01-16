import 'package:daily_quote_app/utils/app_images.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:daily_quote_app/widgets/fav_quote_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuoteController controller = Get.put(QuoteController());
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          Future.delayed(Duration(seconds: 3));
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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

        if (controller.quoteData.isEmpty) {
          return const Center(child: Text("No Quotes Found"));
        }

        return CustomScrollView(
          slivers: [
            /// 🔹 SLIVER APP BAR (Same as CommonScreen)
            SliverAppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              pinned: true,
              expandedHeight: 250,
              backgroundColor: Colors.black87,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Favorites',
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                centerTitle: true,

                background: Image.asset(
                  AppImages.womanImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// 🔹 GRID VIEW AS SLIVER
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final bgImage = AppImages
                      .backgrounds[index % AppImages.backgrounds.length];

                  return Obx(
                    () => FavQuoteCard(
                      image: bgImage,
                      text: controller.quoteData[index].text ?? "",
                      from: controller.quoteData[index].from ?? "",
                      isFav: controller.isFav(index),
                      onFavTap: () => controller.toggleFav(index),
                    ),
                  );
                }, childCount: controller.quoteData.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
