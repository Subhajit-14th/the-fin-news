import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/live_news_provider.dart';

class LiveNewsScreen extends StatefulWidget {
  const LiveNewsScreen({super.key});

  @override
  State<LiveNewsScreen> createState() => _LiveNewsScreenState();
}

class _LiveNewsScreenState extends State<LiveNewsScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) return;

    context.read<LiveNewsProvider>().fetchLiveNewsCategory();
    context.read<LiveNewsProvider>().fetchLiveNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LiveNewsProvider>(
        builder: (context, liveNewsProvider, child) {
      if (liveNewsProvider.isLiveNewsLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
        );
      }
      return Column(
        children: [
          /// Live News Category
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  liveNewsProvider.liveNewsCategory.length,
                  (index) {
                    final category = liveNewsProvider.liveNewsCategory[index];
                    final isSelected =
                        liveNewsProvider.selectedCategory == category;
                    return InkWell(
                      onTap: () {
                        liveNewsProvider.selectCategory(category);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(right: 16),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColor.primaryColor
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          liveNewsProvider.liveNewsCategory[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColor.textColorLight
                                : AppColor.textColorDark,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          /// Live News Items
          Expanded(
            child: ListView.builder(
              itemCount: liveNewsProvider.liveNewsItems.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
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
                        liveNewsProvider.liveNewsItems[index].liveNewsTitle,
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
                            liveNewsProvider.liveNewsItems[index].liveNewsTime,
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
            ),
          ),
        ],
      );
    });
  }
}
