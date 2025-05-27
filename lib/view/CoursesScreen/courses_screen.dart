import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/course_provider.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) return;

    context.read<CourseProvider>().getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<CourseProvider>(builder: (context, courseProvider, child) {
      if (courseProvider.isCourseLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
        );
      }
      return ListView.builder(
        itemCount: courseProvider.courses.length,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          return Container(
            height: 140,
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.tertiaryColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColor.textColorDark.withAlpha(50),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Course Banner
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      courseProvider.courses[index].populerImageUrl,
                      height: 120,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          CachedNetworkImage(
                        imageUrl:
                            'https://dhanvan.in/public/images/upload/prod_default.png',
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Videos',
                              style: TextStyle(
                                color: AppColor.textColorDark,
                                fontSize: 12,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Files',
                              style: TextStyle(
                                color: AppColor.textColorDark,
                                fontSize: 12,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),

                      /// Course Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          courseProvider.courses[index].populerCourseTitle,
                          style: TextStyle(
                            color: AppColor.textColorDark,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),

                      /// Course Price
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          courseProvider.courses[index].populerCoursePrice,
                          style: TextStyle(
                            color: AppColor.textColorDark,
                            fontSize: 16,
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
      );
    });
  }
}
