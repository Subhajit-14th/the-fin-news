import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/reports_provider.dart';

class HomeScreenReports extends StatefulWidget {
  const HomeScreenReports({super.key});

  @override
  State<HomeScreenReports> createState() => _HomeScreenReportsState();
}

class _HomeScreenReportsState extends State<HomeScreenReports> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<ReportsProvider>().fetchReports("", "");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final reportsProvider = Provider.of<ReportsProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 155,
      child: ListView.builder(
        itemCount: reportsProvider.reportsItems.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              height: 150,
              width: 350,
              margin: EdgeInsets.only(right: 16),
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
                        reportsProvider.reportsItems[index].reportsImage,
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            CachedNetworkImage(
                          imageUrl:
                              'https://dhanvan.in/public/images/upload/prod_default.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
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
                            reportsProvider.reportsItems[index].reprtsTitle,
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
                            reportsProvider.reportsItems[index].reportsDuration,
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
    );
  }
}
