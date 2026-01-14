import 'package:daily_quote_app/viewmodel/quote_controller.dart';
import 'package:daily_quote_app/widgets/bottom_navbar.dart';
import 'package:daily_quote_app/widgets/header.dart';
import 'package:daily_quote_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuoteController());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
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
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Daily Affirmation',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
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

                        //
                        Text(
                          'Daily challenge',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
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
                        Text(
                          'Trending stories',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 137,
                          width: 121,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF99855),
        shape: CircleBorder(),
        onPressed: () => controller.changeTab(2), // Center index
        elevation: 0,
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
