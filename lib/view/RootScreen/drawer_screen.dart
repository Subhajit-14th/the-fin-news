import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
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
          drawerItem(
            context: context,
            image: 'assets/icon_pic/smartphone.png',
            newsName: 'Live News',
            index: 0,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/report.png',
            newsName: 'Reports',
            index: 1,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/market_data.png',
            newsName: 'Market Data',
            index: 2,
          ),
          drawerItem(
            context: context,
            image: 'assets/icon_pic/courses.png',
            newsName: 'Courses',
            index: 3,
          ),
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
