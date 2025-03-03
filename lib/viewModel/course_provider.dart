import 'package:flutter/material.dart';
import 'package:the_fin_news/model/LiveNews/populer_course_item.dart';

class CourseProvider extends ChangeNotifier {
  final List<PopulerCourseItem> _courses = [
    PopulerCourseItem(
      populerImageUrl:
          'https://instructor-academy.onlinecoursehost.com/content/images/2023/05/How-to-Create-an-Online-Course-For-Free--Complete-Guide--6.jpg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
    PopulerCourseItem(
      populerImageUrl:
          'https://wealthcreator.co.in/wp-content/uploads/2022/12/Free-Online-Courses-with-Certificates.jpg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
    PopulerCourseItem(
      populerImageUrl:
          'https://www.educourse.co.za/wp-content/uploads/2024/06/IT-Courses-for-Beginners.jpg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
    PopulerCourseItem(
      populerImageUrl:
          'https://images.shiksha.com/mediadata/images/articles/1576227666phpqUHpt1.jpeg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
  ];
  List<PopulerCourseItem> get courses => _courses;
}
