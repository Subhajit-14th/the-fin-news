import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/utils/widgets/common_button.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';
import 'package:the_fin_news/viewModel/live_news_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          theCaroselSlider(),
          SizedBox(height: height * 0.02),

          /// Populer course heading
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Populer Courses',
                  style: TextStyle(
                    color: AppColor.textColorDark,
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColor.primaryColor,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Populer Course
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: homeProvider.populerCourses.length,
              scrollDirection: Axis.horizontal,
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
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
          ),
          SizedBox(height: height * 0.02),

          /// Recently Added Courses heading
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recently Added Courses',
                  style: TextStyle(
                    color: AppColor.textColorDark,
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColor.primaryColor,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Recently Added Courses
          for (var i = 0;
              i < homeProvider.populerCourses.length && i < 3;
              i++) ...[
            Container(
              height: 120,
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
                        homeProvider.populerCourses[i].populerImageUrl,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Course Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            homeProvider.populerCourses[i].populerCourseTitle,
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
                            homeProvider.populerCourses[i].populerCoursePrice,
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
            )
          ],

          /// Contact With Us
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Contact With Us',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColor.textColorDark,
                fontSize: 18,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Contact Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  homeProvider.liveNewsSocialItems.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        spacing: 10,
                        children: [
                          Image.asset(
                            homeProvider.liveNewsSocialItems[index]
                                .liveNewsSocialImageUrl,
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            homeProvider.liveNewsSocialItems[index].title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColor.textColorDark,
                              fontSize: 18,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
        ],
      ),
    );
  }

  /// Carosel Slider
  Widget theCaroselSlider() {
    return Consumer<HomeProvider>(builder: (context, provider, value) {
      return Center(
        child: Stack(
          children: [
            // Carosel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.95,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  provider.updateIndex(index);
                },
              ),
              items: provider.homeCarouselImageUrls.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),

            // Indicator Positioned at the Bottom Center of the Image
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: provider.activeIndex,
                  count: provider.homeCarouselImageUrls.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppColor.primaryColor,
                    dotColor: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
