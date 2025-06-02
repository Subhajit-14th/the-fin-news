import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/MyCourses/my_courses_api_res_model.dart';
import 'package:http/http.dart' as http;
import 'package:the_fin_news/services/hive_database.dart';

class MyCoursesController {
  Future<StudentWiseBatchCourseApiResModel> myCourses() async {
    StudentWiseBatchCourseApiResModel studentWiseBatchCourseApiResModel =
        StudentWiseBatchCourseApiResModel();
    try {
      var headers = {'Authorization': 'Basic Og=='};
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/student-wise-batchcourse.php?student_id=${HiveDatabase.getStudentId()}&batch_id=${HiveDatabase.getBatchId()}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        studentWiseBatchCourseApiResModel =
            StudentWiseBatchCourseApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        studentWiseBatchCourseApiResModel =
            StudentWiseBatchCourseApiResModel.fromJson(jsonDecode(jsonData));
        debugPrint(
            'My courses API Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint("My courses api error: $e");
    }
    return studentWiseBatchCourseApiResModel;
  }
}
