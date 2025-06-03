import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/ReportsModels/report_category_api_res_model.dart';
import 'package:the_fin_news/model/ReportsModels/reports_api_res_model.dart';
import 'package:http/http.dart' as http;

class ReportsController {
  /// GET ALL CATEGORY
  Future<ReportCategoryApiResModel> getReportCategory() async {
    ReportCategoryApiResModel reportCategoryApiResModel =
        ReportCategoryApiResModel();
    try {
      var headers = {'Authorization': 'Basic Og=='};
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/report-category-list-api.php'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        reportCategoryApiResModel =
            ReportCategoryApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(
            'get reports category API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint("Report category api error: $e");
    }
    return reportCategoryApiResModel;
  }

  /// GET ALL REPORTS
  Future<ReportsApiResModel> getAllReports(
      {required String reportCategoryId,
      required String reportCateName}) async {
    ReportsApiResModel reportsApiResModel = ReportsApiResModel();
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/api-report-list.php?report_category_id=$reportCategoryId&report_cate_name=$reportCateName'));

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("============= my jsonData: ${jsonData.toString()}");
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
