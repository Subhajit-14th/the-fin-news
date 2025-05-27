import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/LiveNews/live_news_api_res_model.dart';
import 'package:http/http.dart' as http;
import 'package:the_fin_news/model/LiveNews/live_news_category_api_res_model.dart';

class LiveNewsController {
  Future<LiveNewsDataApiResModel> getLiveNewsData() async {
    LiveNewsDataApiResModel liveNewsDataApiResModel = LiveNewsDataApiResModel();
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/livenews-type-list-api.php'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        liveNewsDataApiResModel =
            LiveNewsDataApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint('Error fetching live news data: $e');
      // Handle error appropriately, e.g., log it or show a message to the user
    }
    return liveNewsDataApiResModel;
  }

  /// live news category
  Future<LiveNewsTypeApiResModel> getLiveNewsCategory() async {
    LiveNewsTypeApiResModel liveNewsTypeApiResModel = LiveNewsTypeApiResModel();
    try {
      var request = http.Request('GET',
          Uri.parse('https://smartstylin.in/fin/admin/api-livenews-list.php'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        liveNewsTypeApiResModel =
            LiveNewsTypeApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint("My live news api error: $e");
    }
    return liveNewsTypeApiResModel;
  }
}
