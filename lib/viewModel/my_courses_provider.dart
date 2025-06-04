import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/MyCoursesController/my_courses_controller.dart';
import 'package:the_fin_news/model/MyCourses/my_course_details_api_res_model.dart';
import 'package:the_fin_news/model/MyCourses/my_courses_api_res_model.dart'
    as mycourse;

class MyCoursesProvider extends ChangeNotifier {
  bool _isLoadMyCourses = false;
  bool get isLoadMyCourses => _isLoadMyCourses;

  bool _isLoadMyCoursesDetails = false;
  bool get isLoadMyCoursesDetails => _isLoadMyCoursesDetails;

  List<mycourse.Courses?> _myCoursesList = [];
  List<mycourse.Courses?> get myCoursesList => _myCoursesList;

  final MyCoursesController _myCoursesController = MyCoursesController();
  mycourse.StudentWiseBatchCourseApiResModel studentWiseBatchCourseApiResModel =
      mycourse.StudentWiseBatchCourseApiResModel();
  MyCourseDetailsApiResModel courseDetailsApiResModel =
      MyCourseDetailsApiResModel();

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

  /// fetch my course details
  void fetchMyCourseDetails(courseId) async {
    _isLoadMyCoursesDetails = true;
    notifyListeners();
    courseDetailsApiResModel =
        await _myCoursesController.getMyCourseDetails(courseId);
    if (courseDetailsApiResModel.status == 200) {
      _isLoadMyCoursesDetails = false;
      notifyListeners();
    } else {
      _isLoadMyCoursesDetails = false;
      notifyListeners();
    }
  }
}
