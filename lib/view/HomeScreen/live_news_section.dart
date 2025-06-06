import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/live_news_provider.dart';

class HomeScreenLiveNews extends StatefulWidget {
  const HomeScreenLiveNews({super.key});

  @override
  State<HomeScreenLiveNews> createState() => _HomeScreenLiveNewsState();
}

class _HomeScreenLiveNewsState extends State<HomeScreenLiveNews> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<LiveNewsProvider>().fetchLiveNewsCategory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Consumer<LiveNewsProvider>(
          builder: (context, liveNewsProvider, child) {
        if (liveNewsProvider.isLiveNewsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        }
        return ListView.builder(
          itemCount: liveNewsProvider.liveNewsItems.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.all(10),
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
                children: [
                  /// News Title
                  Text(
                    liveNewsProvider.liveNewsItems[index].liveNewsTitle,
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),

                  /// News Time, category and share button
                  Row(
                    children: [
                      // Text(
                      //   liveNewsProvider.liveNewsItems[index].liveNewsTime,
                      //   style: TextStyle(
                      //     color: AppColor.textColorDark,
                      //     fontSize: 14,
                      //     fontFamily: 'Lato',
                      //   ),
                      // ),
                      // SizedBox(width: 16),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          liveNewsProvider
                              .liveNewsItems[index].liveNewsCategory,
                          style: TextStyle(
                            color: AppColor.textColorDark,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.share_rounded,
                        color: AppColor.primaryColor,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
