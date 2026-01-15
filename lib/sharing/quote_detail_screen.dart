import 'package:daily_quote_app/sharing/quote_export_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteDetailScreen extends StatelessWidget {
  const QuoteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX ke zariye data receive karna
    final String quoteText = Get.arguments['text'];
    final String author = Get.arguments['author'];
    final String bgImage = Get.arguments['bgImage'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Quote"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: QuoteExportCard(
            text: quoteText,
            author: author,
            bgImage: bgImage,
          ),
        ),
      ),
    );
  }
}
