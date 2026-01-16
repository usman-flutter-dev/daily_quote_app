import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavQuoteCard extends StatelessWidget {
  final String image;
  final String text;
  final String from;
  final bool isFav;
  final VoidCallback onFavTap;

  const FavQuoteCard({
    super.key,
    required this.image,
    required this.text,
    required this.from,
    required this.isFav,
    required this.onFavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(color: Colors.black.withValues(alpha: 0.35)),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          from,
                          style: GoogleFonts.akatab(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onFavTap,
                        child: Icon(
                          isFav ? Icons.favorite_border : Icons.favorite,
                          color: isFav ? Colors.white : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
