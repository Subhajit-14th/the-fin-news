import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/utils/widgets/common_button.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';

class HomeScreenPopulerCourses extends StatelessWidget {
  const HomeScreenPopulerCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 400,
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
                  ),
                ),
                SizedBox(height: height * 0.02),

                /// Course Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    homeProvider.populerCourses[index].populerCourseTitle,
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontSize: 20,
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
                    homeProvider.populerCourses[index].populerCoursePrice,
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                /// get this course button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CommonButton(
                    width: double.infinity,
                    buttonText: 'Get this course',
                    buttonColor: AppColor.secondaryColor,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
