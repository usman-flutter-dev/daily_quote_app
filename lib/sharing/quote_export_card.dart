import 'package:daily_quote_app/sharing/image_export_service.dart';
import 'package:daily_quote_app/utils/colors.dart';
import 'package:flutter/material.dart';

class QuoteExportCard extends StatefulWidget {
  final String text;
  final String author;
  final String? bgImage;

  const QuoteExportCard({
    super.key,
    required this.text,
    required this.author,
    this.bgImage,
  });

  @override
  State<QuoteExportCard> createState() => _QuoteExportCardState();
}

class _QuoteExportCardState extends State<QuoteExportCard> {
  // GlobalKey ko State ke andar rakha taake refresh hone par image capture break na ho
  final GlobalKey globalKey = GlobalKey();

  // Gradients ki list jo user tap karke change kar sakta hai
  int selectedGradientIndex = 0;
  final List<List<Color>> gradients = [
    [Colors.blueAccent, Colors.purpleAccent],
    [Colors.orangeAccent, Colors.redAccent],
    [Colors.tealAccent, Colors.blueAccent],
    [const Color(0xFF8E2DE2), const Color(0xFF4A00E0)],
    [const Color(0xFF11998e), const Color(0xFF38ef7d)],
    [Colors.black87, Colors.grey.shade800],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 1. Interactive Card Part
        GestureDetector(
          onTap: () {
            setState(() {
              // Agla gradient select karne ke liye
              selectedGradientIndex =
                  (selectedGradientIndex + 1) % gradients.length;
            });
          },
          child: RepaintBoundary(
            key: globalKey,
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradients[selectedGradientIndex],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: gradients[selectedGradientIndex][0].withValues(
                      alpha: 0.3,
                    ),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.format_quote, color: Colors.white, size: 50),
                  const SizedBox(height: 20),
                  Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "- ${widget.author}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),
        const Text(
          "Tap on card to change colors 🎨",
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        const SizedBox(height: 30),

        // 2. Share Button Part
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
            ),
            onPressed: () => ImageExportService.captureAndShare(globalKey),
            icon: const Icon(Icons.share_rounded),
            label: const Text(
              "Share as Image",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
