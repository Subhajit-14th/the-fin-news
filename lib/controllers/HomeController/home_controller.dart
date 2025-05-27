import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/HomeScreenModels/home_screen_api_res_model.dart';
import 'package:http/http.dart' as http;

class HomeController {
  Future<HomeApiResModel> fetchHomeData() async {
    HomeApiResModel homeApiResModel = HomeApiResModel();
    try {
      var request = http.Request('GET',
          Uri.parse('https://smartstylin.in/fin/admin/home-list-api.php'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        homeApiResModel = HomeApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint('Error fetching home data: $e');
    }
    return homeApiResModel;
  }
}
