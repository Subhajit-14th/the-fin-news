import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/MyCoursesScreen/video_player_screen.dart';
import 'package:the_fin_news/viewModel/my_courses_provider.dart';

class MyCoursesDetailsScreen extends StatefulWidget {
  const MyCoursesDetailsScreen(
      {super.key, required this.courseId, required this.courseImage});

  final String courseId;
  final String courseImage;

  @override
  State<MyCoursesDetailsScreen> createState() => _MyCoursesDetailsScreenState();
}

class _MyCoursesDetailsScreenState extends State<MyCoursesDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<MyCoursesProvider>().fetchMyCourseDetails(widget.courseId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Course Details',
          style: TextStyle(
            color: AppColor.textColorDark,
            fontSize: 20,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Consumer<MyCoursesProvider>(
          builder: (context, courseProvider, child) {
        if (courseProvider.isLoadMyCoursesDetails) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  widget.courseImage,
                  height: 200,
                  width: double.infinity,
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
            SizedBox(height: 16),

            /// Course Category
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     color: Colors.grey.withAlpha(70),
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            //   child: Text(
            //     '${courseProvider.courseDetailsApiResModel.course?.courseCategory}',
            //     style: TextStyle(
            //       color: AppColor.textColorDark,
            //       fontSize: 14,
            //       fontFamily: 'Lato',
            //     ),
            //   ),
            // ),

            /// Course Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                '${courseProvider.courseDetailsApiResModel.record?.courseTitle}',
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),

            /// Course Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                '${courseProvider.courseDetailsApiResModel.record?.courseDescription}',
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),

            /// Course heading
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Courses',
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: courseProvider
                    .courseDetailsApiResModel.record?.courses?.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = courseProvider
                      .courseDetailsApiResModel.record?.courses?[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(14),
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
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              'https://static.vecteezy.com/system/resources/thumbnails/001/505/014/small_2x/video-player-icon-free-vector.jpg',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  '${item?.chapter}',
                                  style: TextStyle(
                                    color: AppColor.textColorDark,
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VideoPlayerScreen(
                                                videoUrl: "${item?.videoUrl}",
                                              )));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                ),
                                child: Text(
                                  '▷ Play Now',
                                  style: TextStyle(
                                    color: Colors.white,
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
            ),
          ],
        );
      }),
    );
  }
}
