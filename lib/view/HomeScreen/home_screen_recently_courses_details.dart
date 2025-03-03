import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/utils/widgets/common_button.dart';
import 'package:the_fin_news/viewModel/recently_courses_provider.dart';

class HomeScreenRecentlyCoursesDetails extends StatelessWidget {
  const HomeScreenRecentlyCoursesDetails({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    final recentlyCoursesProvider =
        Provider.of<RecentlyCoursesProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: TextStyle(
            color: AppColor.textColorDark,
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Overview and content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(
                  recentlyCoursesProvider.recentlyCoursesCategory.length,
                  (index) {
                    final category =
                        recentlyCoursesProvider.recentlyCoursesCategory[index];
                    final isSelected =
                        recentlyCoursesProvider.selectedCategory == category;
                    return InkWell(
                      onTap: () {
                        recentlyCoursesProvider.selectCategory(category);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(right: 16),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColor.primaryColor
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          recentlyCoursesProvider
                              .recentlyCoursesCategory[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColor.textColorLight
                                : AppColor.textColorDark,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(color: Colors.grey.withAlpha(50)),

            /// Heading Of course
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                pageTitle,
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),

            /// Courses tags
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
            ),
            SizedBox(height: height * 0.02),

            /// Course image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  'https://i.ytimg.com/vi/9ebG56arooU/maxresdefault.jpg',
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Divider(
              color: Colors.grey.withAlpha(50),
              thickness: 2,
            ),
            SizedBox(height: height * 0.01),

            /// About the course heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'About This Course',
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'The Best And Most Affordable Environment Course (Hindi/ English) for UPSC and state PSC Exams. This comprehensive course is designed to provide in-depth knowledge and understanding of environmental concepts, which are crucial for competitive exams',
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Expiring Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.black54),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Expiring on 2026/05/31",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Course access will automatically be ended after midnight",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),

            /// Video lecture Details
            ListTile(
              leading: const Icon(Icons.play_circle_fill,
                  color: Colors.blue, size: 32),
              title: const Text(
                "22 Learning Material",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("6 Files, 16 Video lectures"),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: Colors.blue,
                        size: 18,
                      ),
                      Text(
                        "Video Restrictions",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            SizedBox(height: height * 0.01),

            /// Course Details
            Card(
              color: Colors.yellow[100],
              margin: EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What else you will get?",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Live Classes
                        const Icon(Icons.live_tv, color: Colors.red),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Live Classes",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Interactive video lessons",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Available on PC
                        const Icon(Icons.computer, color: Colors.blue),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Available on PC",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Bigger screen, better clarity",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹ 4500',
              style: TextStyle(
                color: AppColor.textColorLight,
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            CommonButton(
              height: 40,
              width: 140,
              buttonText: 'Buy Now',
              buttonColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
