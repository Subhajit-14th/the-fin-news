import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/ReportsScreen/reports_details_screen.dart';
import 'package:the_fin_news/viewModel/reports_provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<ReportsProvider>().fetchReportCategory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<ReportsProvider>(
        builder: (context, reportsProvider, child) {
      if (reportsProvider.isReportLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Reports Category
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  reportsProvider.reportsCategory.length,
                  (index) {
                    final category = reportsProvider.reportsCategory[index];
                    final isSelected =
                        reportsProvider.selectedCategory == category;
                    return InkWell(
                      onTap: () {
                        reportsProvider.selectCategory(category);
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
                          reportsProvider.reportsCategory[index],
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

          /// Reports Items
          reportsProvider.reportsItems.isEmpty
              ? Center(
                  child: Text('No records found'),
                )
              : ListView.builder(
                  itemCount: reportsProvider.reportsItems.length,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportsDetailsScreen(
                                      image: reportsProvider
                                          .reportsItems[index].reportsImage,
                                      title: reportsProvider
                                          .reportsItems[index].reprtsTitle,
                                      duration: reportsProvider
                                          .reportsItems[index].reportsDuration,
                                      description: reportsProvider
                                          .reportsItems[index]
                                          .reportsDescription,
                                    )));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                                  reportsProvider
                                      .reportsItems[index].reportsImage,
                                  height: 120,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) =>
                                      CachedNetworkImage(
                                    imageUrl:
                                        'https://dhanvan.in/public/images/upload/prod_default.png',
                                    height: 120,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /// Course Title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      reportsProvider
                                          .reportsItems[index].reprtsTitle,
                                      style: TextStyle(
                                        color: AppColor.textColorDark,
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),

                                  /// Report Category
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      reportsProvider
                                          .reportsItems[index].reportsCategory,
                                      style: TextStyle(
                                        color: AppColor.textColorDark,
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),

                                  /// Report description
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      reportsProvider.reportsItems[index]
                                          .reportsDescription,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: AppColor.textColorDark,
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),

                                  /// Report duration
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      reportsProvider
                                          .reportsItems[index].reportsDuration,
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
                      ),
                    );
                  },
                ),
        ],
      );
    });
  }
}
