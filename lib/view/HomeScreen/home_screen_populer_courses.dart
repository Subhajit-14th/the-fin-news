import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';

class HomeScreenPopulerCourses extends StatelessWidget {
  const HomeScreenPopulerCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: homeProvider.populerCourses.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 16),
            width: 350,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Course Banner
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  child: Image.network(
                    homeProvider.populerCourses[index].populerImageUrl,
                    height: 200,
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
                SizedBox(height: height * 0.02),

                /// Course Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        homeProvider.populerCourses[index].populerCourseTitle,
                        style: TextStyle(
                          color: AppColor.textColorDark,
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          homeProvider
                              .populerCourses[index].populerCourseCategory,
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
                SizedBox(height: height * 0.01),

                /// Course Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    homeProvider.populerCourses[index].populerCourseDescription,
                    maxLines: 2,
                    style: TextStyle(
                        color: AppColor.textColorDark,
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(height: height * 0.02),

                /// get this course button
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: CommonButton(
                //     width: double.infinity,
                //     buttonText: 'Get this course',
                //     buttonColor: AppColor.secondaryColor,
                //     onTap: context.read<AuthServices>().isLoginDone
                //         ? () {}
                //         : () {
                //             ScaffoldMessenger.of(context).showSnackBar(
                //               SnackBar(
                //                 content: Text(
                //                   'Please login to your account to get this course',
                //                   style: const TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 backgroundColor: AppColor.secondaryColor,
                //                 duration: const Duration(seconds: 3),
                //                 behavior: SnackBarBehavior.floating,
                //                 margin: const EdgeInsets.only(
                //                   bottom: 50,
                //                   left: 20,
                //                   right: 20,
                //                 ),
                //                 shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(12),
                //                 ),
                //                 elevation: 10,
                //                 action: SnackBarAction(
                //                   label: 'Close',
                //                   textColor: Colors.white,
                //                   onPressed: () {
                //                     ScaffoldMessenger.of(context)
                //                         .hideCurrentSnackBar();
                //                   },
                //                 ),
                //               ),
                //             );
                //           },
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
