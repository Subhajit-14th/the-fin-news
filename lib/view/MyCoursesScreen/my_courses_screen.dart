import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/MyCoursesScreen/my_courses_details.dart';
import 'package:the_fin_news/viewModel/my_courses_provider.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<MyCoursesProvider>().fetchMyCoursesList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyCoursesProvider>(builder: (context, myCourses, child) {
      if (myCourses.isLoadMyCourses) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      final DateTime now = DateTime.now();
      final DateTime? startDate = myCourses
                  .studentWiseBatchCourseApiResModel.record?.batchStartDate !=
              null
          ? DateTime.tryParse(
              "${myCourses.studentWiseBatchCourseApiResModel.record?.batchStartDate}")
          : null;
      final DateTime? endDate = myCourses
                  .studentWiseBatchCourseApiResModel.record?.batchEndDate !=
              null
          ? DateTime.tryParse(
              "${myCourses.studentWiseBatchCourseApiResModel.record?.batchEndDate}")
          : null;

      String? statusText;
      if (startDate != null && endDate != null) {
        if (now.isBefore(startDate)) {
          statusText = "Your batch has not started yet.";
        } else if (now.isAfter(endDate)) {
          statusText = "Your batch has expired.";
        }
      }

      return statusText != null
          ? Text(
              statusText,
              style: TextStyle(
                color: Colors.red.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  'My Courses',
                  style: TextStyle(
                    color: AppColor.textColorDark,
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: ListView.builder(
                itemCount: myCourses.myCoursesList.length,
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                itemBuilder: (context, index) {
                  final item = myCourses.myCoursesList[index];
                  return Container(
                    padding: EdgeInsets.all(14),
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(50),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              '${item?.coursePhoto}',
                              height: 100,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) =>
                                  CachedNetworkImage(
                                imageUrl:
                                    'https://dhanvan.in/public/images/upload/prod_default.png',
                                // height: 200,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item?.courseTitle}',
                                style: TextStyle(
                                  color: AppColor.textColorDark,
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Html(
                                data: "${item?.courseDescription}",
                                style: {
                                  "body": Style(
                                    color: AppColor.textColorDark,
                                    fontSize: FontSize(16),
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyCoursesDetailsScreen(
                                        courseId: "${item?.courseId}",
                                        courseImage: "${item?.coursePhoto}",
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'View Details',
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
    });
  }
}
