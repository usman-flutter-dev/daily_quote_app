import 'dart:convert';
import 'package:daily_quote_app/model/pexel_model.dart';
import 'package:daily_quote_app/model/quotes_model.dart';
import 'package:daily_quote_app/utils/api_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuoteController extends GetxController {
  // Fav Quote
  RxSet<int> favIndexes = <int>{}.obs;

  void toggleFav(int index) {
    if (favIndexes.contains(index)) {
      favIndexes.remove(index);
    } else {
      favIndexes.add(index);
    }
  }

  bool isFav(int index) {
    return favIndexes.contains(index);
  }

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
    fetchPexelData();
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

  // Pexel API
  Rx<Pexel?> pexelData = Rx<Pexel?>(null);
  RxList<Photos> photosList = <Photos>[].obs;

  Future<void> fetchPexelData() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(ApiKey.pexelSearchAPIURL),
        headers: {'Authorization': ApiKey.pexelAPIKey},
      );
      print('STATUS: ${response.statusCode}');
      print('BODY: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        final pexel = Pexel.fromJson(decodedData);
        pexelData.value = pexel;
        photosList.addAll(pexel.photos ?? []);
        // pexelData.value = decodedData.map((v) => Pexel.fromJson(v)).toList();
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
