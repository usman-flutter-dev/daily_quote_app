import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://i.pinimg.com/736x/15/5d/44/155d443821b50fddaecd10b51bb495f1.jpg',
          ),
          backgroundColor: Color(0xFFFFBFB8),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning 👋", style: GoogleFonts.aboreto(fontSize: 14)),
            SizedBox(height: 4),
            Text(
              "Sarah Josiah",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Spacer(),
        const Icon(Icons.notifications_none),
      ],
    );
  }
}
