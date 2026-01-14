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
          prefixIcon: const Icon(Icons.search, color: Color(0xFFF97C25)),
          hintText: "Search",
          hintStyle: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff192126).withValues(alpha: 0.5),
          ),
          filled: true,
          fillColor: Color(0xFFBABBBE).withValues(alpha: 0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
