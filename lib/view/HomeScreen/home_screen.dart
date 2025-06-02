import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen_carosel_slider.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen_market_data.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen_populer_courses.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen_recently_added_courses.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen_reports_data.dart';
import 'package:the_fin_news/view/HomeScreen/live_news_section.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    context.read<HomeProvider>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: homeProvider.isHomeDataLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeScreenCaroselSlider(),
                SizedBox(height: height * 0.02),

                /// Live News heading
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Live News',
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
                HomeScreenLiveNews(),

                /// Reports heading
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reports',
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
                HomeScreenReports(),

                /// Market Data Heading
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Market Data',
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
                HomeScreenMarketData(),

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
                HomeScreenPopulerCourses(),
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
                    i < homeProvider.recenthlyAddedCourses.length && i < 3;
                    i++) ...[
                  HomeScreenRecentlyAddedCourses(
                    index: i,
                  ),
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
}
