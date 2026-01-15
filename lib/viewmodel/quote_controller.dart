import 'dart:convert';

import 'package:daily_quote_app/model/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuoteController extends GetxController {
  // Chips
  // Use .obs to make it reactive!
  var selectedChipIndex = 0.obs;
  // A method to update the index when a user clicks
  void updateSelectedChip(int index) {
    selectedChipIndex.value = index;
  }

  List<String> chips = [
    'All',
    'Motivation',
    'Failure',
    'Work',
    'Success',
    'Hate',
    'Love',
    'Sad',
    'Happy',
    'Travel',
    'Men',
    'Women',
  ];
  // Chips Ends

  // API Starts
  // API URL
  final String baseURL = 'https://jsonguide.technologychannel.org';
  final String quotesEndPoint = '/quotes.json';
  RxBool isLoading = false.obs;
  RxList<QuotesModel> quoteData = <QuotesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseURL + quotesEndPoint));

      if (response.statusCode == 200) {
        // Data ko Decode Kiya hai
        List<dynamic> decodedData = jsonDecode(response.body);

        // Data ko Dart Objects mn Convert kia hai taa keh use kr skyn
        quoteData.value = decodedData
            .map((e) => QuotesModel.fromJson(e))
            .toList();
      } else {
        Get.snackbar(
          "Error",
          "Server se data nahi mila: ${response.statusCode}",
          margin: EdgeInsets.all(15),
          borderRadius: 15,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Kuch galat hua: $e",
        margin: EdgeInsets.all(15),
        borderRadius: 15,
      );
    } finally {
      isLoading(false);
    }
  }
}
