import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen_recently_courses_details.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';

class HomeScreenRecentlyAddedCourses extends StatelessWidget {
  const HomeScreenRecentlyAddedCourses({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreenRecentlyCoursesDetails(
              pageTitle:
                  homeProvider.recenthlyAddedCourses[index].populerCourseTitle,
            ),
          ),
        );
      },
      child: Container(
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
                  homeProvider.recenthlyAddedCourses[index].populerImageUrl,
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      homeProvider
                          .recenthlyAddedCourses[index].populerCourseCategory,
                      style: TextStyle(
                        color: AppColor.textColorDark,
                        fontSize: 12,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  /// Course Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      homeProvider
                          .recenthlyAddedCourses[index].populerCourseTitle,
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
                      homeProvider.recenthlyAddedCourses[index]
                          .populerCourseDescription,
                      maxLines: 2,
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
      ),
    );
  }
}
