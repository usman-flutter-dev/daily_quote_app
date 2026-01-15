import 'package:daily_quote_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppColors.primaryOrange),
          hintText: "Search",
          hintStyle: GoogleFonts.lato(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryOrange.withValues(alpha: 0.7),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
