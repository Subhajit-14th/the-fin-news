import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/course_provider.dart';

class HomeScreenRecentlyCoursesDetails extends StatefulWidget {
  const HomeScreenRecentlyCoursesDetails({super.key, required this.courseId});

  final String courseId;

  @override
  State<HomeScreenRecentlyCoursesDetails> createState() =>
      _HomeScreenRecentlyCoursesDetailsState();
}

class _HomeScreenRecentlyCoursesDetailsState
    extends State<HomeScreenRecentlyCoursesDetails> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        if (!mounted) return;
        context.read<CourseProvider>().getNormalCourseDetails(widget.courseId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<CourseProvider>(builder: (context, courseProvider, child) {
      if (courseProvider.isCourseDetailsLoading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          ),
        );
      }
      return Scaffold(
        backgroundColor: AppColor.tertiaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.tertiaryColor,
          title: Text(
            courseProvider.normalCourseDetailsApiResModel.course?.courseTitle ??
                '',
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
              /// Course image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    '${courseProvider.normalCourseDetailsApiResModel.course?.coursePhoto}',
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),

              /// Heading Of course
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  courseProvider
                          .normalCourseDetailsApiResModel.course?.courseTitle ??
                      '',
                  style: TextStyle(
                    color: AppColor.textColorDark,
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),

              /// Course Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${courseProvider.normalCourseDetailsApiResModel.course?.courseDescription}',
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Row(
              //     children: [
              //       const Icon(Icons.info_outline, color: Colors.black54),
              //       const SizedBox(width: 8),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Text(
              //               "Expiring on 2026/05/31",
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 fontFamily: 'Lato',
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             Text(
              //               "Course access will automatically be ended after midnight",
              //               style: TextStyle(
              //                 color: Colors.black54,
              //                 fontSize: 14,
              //                 fontFamily: 'Lato',
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: height * 0.01),

              /// Video lecture Details
              // ListTile(
              //   leading: const Icon(Icons.play_circle_fill,
              //       color: Colors.blue, size: 32),
              //   title: const Text(
              //     "22 Learning Material",
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       fontFamily: 'Lato',
              //     ),
              //   ),
              //   subtitle: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text("6 Files, 16 Video lectures"),
              //       Row(
              //         spacing: 4,
              //         children: [
              //           Icon(
              //             Icons.info_outline_rounded,
              //             color: Colors.blue,
              //             size: 18,
              //           ),
              //           Text(
              //             "Video Restrictions",
              //             style: TextStyle(
              //               color: Colors.blue,
              //               fontSize: 14,
              //               fontFamily: 'Lato',
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              //   trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              // ),
              // SizedBox(height: height * 0.01),

              /// Course Details
              // Card(
              //   color: Colors.yellow[100],
              //   margin: EdgeInsets.symmetric(horizontal: 16),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           "What else you will get?",
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontFamily: 'Lato',
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         SizedBox(height: height * 0.01),
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             /// Live Classes
              //             const Icon(Icons.live_tv, color: Colors.red),
              //             const SizedBox(width: 8),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: const [
              //                   Text(
              //                     "Live Classes",
              //                     style: TextStyle(
              //                       fontSize: 14,
              //                       fontFamily: 'Lato',
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                   Text(
              //                     "Interactive video lessons",
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                       fontFamily: 'Lato',
              //                       color: Colors.black54,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),

              //             /// Available on PC
              //             const Icon(Icons.computer, color: Colors.blue),
              //             const SizedBox(width: 8),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: const [
              //                   Text(
              //                     "Available on PC",
              //                     style: TextStyle(
              //                       fontSize: 14,
              //                       fontFamily: 'Lato',
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                   Text(
              //                     "Bigger screen, better clarity",
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                       fontFamily: 'Lato',
              //                       color: Colors.black54,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: height * 0.02),
            ],
          ),
        ),
        // bottomNavigationBar: Container(
        //   height: 70,
        //   width: double.infinity,
        //   padding: EdgeInsets.symmetric(horizontal: 18),
        //   decoration: BoxDecoration(
        //     color: Colors.black,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         '₹ 4500',
        //         style: TextStyle(
        //           color: AppColor.textColorLight,
        //           fontSize: 18,
        //           fontFamily: 'Lato',
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       CommonButton(
        //         height: 40,
        //         width: 140,
        //         buttonText: 'Buy Now',
        //         buttonColor: AppColor.primaryColor,
        //       ),
        //     ],
        //   ),
        // ),
      );
    });
  }
}
