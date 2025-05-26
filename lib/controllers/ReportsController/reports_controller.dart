import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/ReportsModels/reports_api_res_model.dart';
import 'package:http/http.dart' as http;

class ReportsController {
  Future<ReportsApiResModel> getAllReports() async {
    ReportsApiResModel reportsApiResModel = ReportsApiResModel();
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://finnews.infyedgesolutions.com/api-report-list.php'));

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        reportsApiResModel = ReportsApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(
            'get reports API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle any exceptions that may occur
      debugPrint('Error fetching reports: $e');
    }
    return reportsApiResModel;
  }
}
