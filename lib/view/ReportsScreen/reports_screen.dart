import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/ReportsScreen/reports_details_screen.dart';
import 'package:the_fin_news/viewModel/reports_provider.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Reports Category
        Consumer<ReportsProvider>(builder: (context, reportsProvider, child) {
          return Padding(
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
          );
        }),

        /// Reports Items
        ListView.builder(
          itemCount: context.read<ReportsProvider>().reportsItems.length,
          padding: EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportsDetailsScreen(
                              image: context
                                  .read<ReportsProvider>()
                                  .reportsItems[index]
                                  .reportsImage,
                              title: context
                                  .read<ReportsProvider>()
                                  .reportsItems[index]
                                  .reprtsTitle,
                              duration: context
                                  .read<ReportsProvider>()
                                  .reportsItems[index]
                                  .reportsDuration,
                              description: context
                                  .read<ReportsProvider>()
                                  .reportsItems[index]
                                  .reportsDescription,
                            )));
              },
              child: Container(
                height: 140,
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
                          context
                              .read<ReportsProvider>()
                              .reportsItems[index]
                              .reportsImage,
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
                              context
                                  .read<ReportsProvider>()
                                  .reportsItems[index]
                                  .reprtsTitle,
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
                              context
                                  .read<ReportsProvider>()
                                  .reportsItems[index]
                                  .reportsDuration,
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
  }
}
