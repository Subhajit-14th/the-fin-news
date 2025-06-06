import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/reports_provider.dart';

class FilterReportDetailsScreen extends StatefulWidget {
  const FilterReportDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<FilterReportDetailsScreen> createState() =>
      _FilterReportDetailsScreenState();
}

class _FilterReportDetailsScreenState extends State<FilterReportDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<ReportsProvider>().fetchReportCategory();
        context.read<ReportsProvider>().filterReports(widget.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.tertiaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.tertiaryColor,
        title: Text("Reports Details"),
      ),
      body:
          Consumer<ReportsProvider>(builder: (context, reportsProvider, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Reports Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  reportsProvider.filterReportImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),

              /// Reports Title
              Text(
                reportsProvider.filterReportTitle,
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),

              /// Reports Duration
              Text(
                reportsProvider.filterReportDuration,
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 10),

              /// Reports Description
              Text(
                reportsProvider.filterReportDescription,
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
