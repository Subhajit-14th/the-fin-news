import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/LiveNews/live_news_screen.dart';
import 'package:the_fin_news/view/RootScreen/drawer_screen.dart';
import 'package:the_fin_news/viewModel/screen_route_provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenRouteProvider = Provider.of<ScreenRouteProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.textColorLight,
      appBar: AppBar(
        backgroundColor: AppColor.tertiaryColor,
        title: Text(
          screenRouteProvider.screenNames[screenRouteProvider.currentCount],
          style: TextStyle(
            color: AppColor.textColorDark,
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const DrawerScreen(),
      body: [
        LiveNewsScreen(),
        Container(
          height: height,
          width: width,
          color: Colors.green,
        ),
        Container(
          height: height,
          width: width,
          color: Colors.amber,
        ),
        Container(
          height: height,
          width: width,
          color: Colors.red,
        ),
      ][screenRouteProvider.currentCount],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10, left: 16, right: 16),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: AppColor.tertiaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.textColorDark.withAlpha(100),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/smartphone.png',
              newsName: 'Live News',
              index: 0,
            ),
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/report.png',
              newsName: 'Reports',
              index: 1,
            ),
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/market_data.png',
              newsName: 'Market Data',
              index: 2,
            ),
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/courses.png',
              newsName: 'Courses',
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  /// -------- Bottom navigation bar buttons
  Widget bottomNavigationBarButton({
    required BuildContext context,
    required String image,
    required String newsName,
    required int index,
  }) {
    return Consumer<ScreenRouteProvider>(builder: (context, provider, child) {
      bool isSelected = provider.currentCount == index;
      return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
          tween: Tween<double>(
              begin: isSelected ? 1.0 : 0.0, end: isSelected ? 1.0 : 0.0),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, -value * 10),
              child: InkWell(
                onTap: () {
                  provider.setScreenRoute(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(
                      AssetImage(
                        image,
                      ),
                      color: isSelected
                          ? AppColor.primaryColor
                          : AppColor.textColorDark,
                    ),
                    Text(
                      newsName,
                      style: TextStyle(
                        color: isSelected
                            ? AppColor.primaryColor
                            : AppColor.textColorDark,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
