import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/MyCoursesController/my_courses_controller.dart';
import 'package:the_fin_news/model/MyCourses/my_courses_api_res_model.dart';

class MyCoursesProvider extends ChangeNotifier {
  bool _isLoadMyCourses = false;
  bool get isLoadMyCourses => _isLoadMyCourses;

  List<Courses?> _myCoursesList = [];
  List<Courses?> get myCoursesList => _myCoursesList;

  final MyCoursesController _myCoursesController = MyCoursesController();
  StudentWiseBatchCourseApiResModel studentWiseBatchCourseApiResModel =
      StudentWiseBatchCourseApiResModel();

  /// fetch my courses list
  void fetchMyCoursesList() async {
    _isLoadMyCourses = true;
    notifyListeners();
    studentWiseBatchCourseApiResModel = await _myCoursesController.myCourses();
    if (studentWiseBatchCourseApiResModel.status == 200) {
      _myCoursesList.clear();
      studentWiseBatchCourseApiResModel.record?.courses?.forEach(
        (element) {
          _myCoursesList.add(element);
        },
      );
      _isLoadMyCourses = false;
      notifyListeners();
    } else {
      _isLoadMyCourses = false;
      notifyListeners();
    }
  }
}
