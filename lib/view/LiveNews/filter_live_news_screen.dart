import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/live_news_provider.dart';

class FilterLiveNewsScreen extends StatefulWidget {
  const FilterLiveNewsScreen({super.key, required this.id});

  final String id;

  @override
  State<FilterLiveNewsScreen> createState() => _FilterLiveNewsScreenState();
}

class _FilterLiveNewsScreenState extends State<FilterLiveNewsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<LiveNewsProvider>().fetchLiveNewsData("", "");
        context.read<LiveNewsProvider>().getFilterLiveNewsData(widget.id);
      },
    );
  }

  /// get filter data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.tertiaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.tertiaryColor,
        title: Text(
          'Live News',
          style: TextStyle(
            color: AppColor.textColorDark,
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<LiveNewsProvider>(
          builder: (context, liveNewsProvider, child) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// News Title
                  Text(
                    liveNewsProvider.filterLiveNewsTitle,
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  /// News Time, category and share button
                  Row(
                    children: [
                      Text(
                        liveNewsProvider.filterLiveNewsTime,
                        style: TextStyle(
                          color: AppColor.textColorDark,
                          fontSize: 14,
                          fontFamily: 'Lato',
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          liveNewsProvider.filterLiveNewsCategory,
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
            )
          ],
        );
      }),
    );
  }
}
