import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/services/hive_database.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/LoginScreen/login_screen.dart';
import 'package:the_fin_news/view/MyCoursesScreen/my_courses_screen.dart';
import 'package:the_fin_news/viewModel/auth_services_provider.dart';
import 'package:the_fin_news/viewModel/screen_route_provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: AppColor.tertiaryColor,
      elevation: 0,
      child: Column(
        children: [
          SizedBox(height: height * 0.05),
          Consumer<AuthServices>(builder: (context, authServices, child) {
            if (!authServices.isLoginDone) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPageScreen()));
                },
                child: SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 14,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: AppColor.textColorDark,
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.login_rounded,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        radius: 42,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                          ),
                        ),
                      ),
                      Text(
                        '${HiveDatabase.getUserName()}',
                        style: TextStyle(
                          color: AppColor.textColorDark,
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.red,
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: height * 0.02),

          /// Drawer items
          drawerItem(
            context: context,
            image: 'assets/icon_pic/home.png',
            newsName: 'Home',
            index: 0,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/smartphone.png',
            newsName: 'Live News',
            index: 1,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/report.png',
            newsName: 'Reports',
            index: 2,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/market_data.png',
            newsName: 'Market Data',
            index: 3,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/courses.png',
            newsName: 'Courses',
            index: 4,
          ),
          SizedBox(height: height * 0.02),

          Consumer<AuthServices>(
            builder: (context, value, child) {
              if (!value.isLoginDone) {
                return SizedBox();
              }
              return Column(
                children: [
                  /// MY COURSES
                  ListTile(
                    tileColor: Colors.transparent,
                    leading: ImageIcon(
                      AssetImage(
                        "assets/icon_pic/my_courses.png",
                      ),
                      color: AppColor.textColorDark,
                    ),
                    title: Text(
                      "My Courses",
                      style: TextStyle(
                        color: AppColor.textColorDark,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyCoursesScreen()));
                    },
                  ),

                  /// PROFILE
                  ListTile(
                    tileColor: Colors.transparent,
                    leading: ImageIcon(
                      AssetImage(
                        "assets/icon_pic/profile.png",
                      ),
                      color: AppColor.textColorDark,
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        color: AppColor.textColorDark,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
          SizedBox(height: height * 0.02),

          // Text(
          //   'Version 1.0.0',
          //   style: TextStyle(
          //     color: AppColor.textColorDark,
          //     fontSize: 14,
          //     fontFamily: 'Lato',
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }

  /// Get Drawer Items
  Widget drawerItem({
    required BuildContext context,
    required String image,
    required String newsName,
    required int index,
  }) {
    return Consumer<ScreenRouteProvider>(builder: (context, provider, child) {
      bool isSelected = provider.currentCount == index;
      return ListTile(
        tileColor: isSelected ? AppColor.primaryColor : Colors.transparent,
        leading: ImageIcon(
          AssetImage(
            image,
          ),
          color: isSelected ? AppColor.tertiaryColor : AppColor.textColorDark,
        ),
        title: Text(
          newsName,
          style: TextStyle(
            color: isSelected ? AppColor.tertiaryColor : AppColor.textColorDark,
            fontSize: 14,
            fontFamily: 'Raleway',
          ),
        ),
        onTap: () {
          provider.setScreenRoute(index);
          Navigator.pop(context);
        },
      );
    });
  }
}
