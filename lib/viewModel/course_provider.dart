import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/CoursesController/courses_controller.dart';
import 'package:the_fin_news/model/CoursesModel/courses_api_res_model.dart';
import 'package:the_fin_news/model/LiveNews/populer_course_item.dart';

class CourseProvider extends ChangeNotifier {
  final List<PopulerCourseItem> _courses = [];
  List<PopulerCourseItem> get courses => _courses;

  final CoursesController _coursesController = CoursesController();
  RecentlyCoursesApiResModel recentlyCoursesApiResModel =
      RecentlyCoursesApiResModel();

  bool _isCourseLoading = false;
  bool get isCourseLoading => _isCourseLoading;

  /// get course data
  void getAllCourses() async {
    _isCourseLoading = true;
    notifyListeners();
    recentlyCoursesApiResModel = await _coursesController.getAllCourses();
    if (recentlyCoursesApiResModel.status == 200) {
      _courses.clear();
      recentlyCoursesApiResModel.record?.forEach(
        (element) {
          _courses.add(PopulerCourseItem(
            populerImageUrl: element.coursePhoto ?? "",
            populerCourseTitle: element.courseTitle ?? "",
            populerCoursePrice: element.courseDiscountPrice ?? "",
          ));
        },
      );
      _isCourseLoading = false;
    } else {
      _isCourseLoading = false;
    }
    notifyListeners();
  }
}
