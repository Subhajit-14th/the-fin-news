import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/CoursesModel/course_details_api_res_model.dart';
import 'package:the_fin_news/model/CoursesModel/courses_api_res_model.dart';
import 'package:http/http.dart' as http;

class CoursesController {
  Future<RecentlyCoursesApiResModel> getAllCourses() async {
    RecentlyCoursesApiResModel recentlyCoursesApiResModel =
        RecentlyCoursesApiResModel();
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/api-recent-course-list.php'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        recentlyCoursesApiResModel =
            RecentlyCoursesApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint("Coursses api error: $e");
    }
    return recentlyCoursesApiResModel;
  }

  Future<NormalCourseDetailsApiResModel> getNormalCourseDetails(
      courseId) async {
    NormalCourseDetailsApiResModel normalCourseDetailsApiResModel =
        NormalCourseDetailsApiResModel();
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/course-details.php?course_id=$courseId'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        normalCourseDetailsApiResModel =
            NormalCourseDetailsApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint("Normal Course details api error: $e");
    }
    return normalCourseDetailsApiResModel;
  }
}
