import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/CoursesScreen/courses_screen.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen.dart';
import 'package:the_fin_news/view/HomeScreen/home_screen_recently_courses_details.dart';
import 'package:the_fin_news/view/LiveNews/filter_live_news_screen.dart';
import 'package:the_fin_news/view/LiveNews/live_news_screen.dart';
import 'package:the_fin_news/view/MerketData/merket_data_screen.dart';
import 'package:the_fin_news/view/ReportsScreen/filter_report_details_screen.dart';
import 'package:the_fin_news/view/ReportsScreen/reports_screen.dart';
import 'package:the_fin_news/view/RootScreen/drawer_screen.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';
import 'package:the_fin_news/viewModel/screen_route_provider.dart';
import 'package:the_fin_news/model/LoginModel/global_search_api_res_model.dart'
    as models;

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  String getDisplayType(String? source) {
    switch (source) {
      case 'add_course':
        return 'Course';
      case 'add_report':
        return 'Report';
      case 'add_livenews':
        return 'Live News';
      case 'add_blog':
        return 'Blog';
      default:
        return 'Unknown';
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<HomeProvider>().getGlobalData("a");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenRouteProvider = Provider.of<ScreenRouteProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.textColorLight,
      appBar: AppBar(
        backgroundColor: AppColor.tertiaryColor,
        automaticallyImplyLeading: screenRouteProvider.currentCount == 0
            ? _isSearching
                ? false
                : true
            : true,
        title: screenRouteProvider.currentCount == 0
            ? _isSearching
                ? RawAutocomplete<models.Record>(
                    textEditingController: _searchController,
                    focusNode: _searchFocusNode,
                    displayStringForOption: (models.Record option) =>
                        option.title ?? '',
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<models.Record>.empty();
                      }
                      return context.read<HomeProvider>().allSuggestions.where(
                          (record) => (record.title ?? '')
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          onChanged: (value) async {
                            debugPrint("Myword is: $value");
                            setState(() {});
                            await context
                                .read<HomeProvider>()
                                .getGlobalData(value);
                          });
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return StatefulBuilder(builder: (context, setState) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4.0,
                            child: Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(maxHeight: 200),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListView.builder(
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final option = options.elementAt(index);
                                  return ListTile(
                                    title: Text(option.title ?? ''),
                                    subtitle:
                                        Text(getDisplayType(option.source)),
                                    onTap: () {
                                      onSelected(option);
                                      _searchFocusNode.unfocus();
                                      final type =
                                          getDisplayType(option.source);

                                      debugPrint(
                                          "My option is: ${option.title}, $type");
                                      _searchController.clear();

                                      if (type == 'Course') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreenRecentlyCoursesDetails(
                                              courseId: "${option.id}",
                                            ),
                                          ),
                                        );
                                      } else if (type == 'Live News') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FilterLiveNewsScreen(
                                              id: "${option.id}",
                                            ),
                                          ),
                                        );
                                      } else if (type == 'Report') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FilterReportDetailsScreen(
                                              id: "${option.id}",
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  )
                : Text(
                    screenRouteProvider
                        .screenNames[screenRouteProvider.currentCount],
                    style: TextStyle(
                      color: AppColor.textColorDark,
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  )
            : Text(
                screenRouteProvider
                    .screenNames[screenRouteProvider.currentCount],
                style: TextStyle(
                  color: AppColor.textColorDark,
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          screenRouteProvider.currentCount == 0
              ? IconButton(
                  icon: Icon(_isSearching ? Icons.close : Icons.search_rounded),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _isSearching = !_isSearching;
                      if (_isSearching) {
                        _searchFocusNode.requestFocus();
                      } else {
                        _searchFocusNode.unfocus();
                      }
                    });
                  },
                )
              : SizedBox(),
        ],
      ),
      drawer: const DrawerScreen(),
      body: [
        HomeScreen(),
        LiveNewsScreen(),
        ReportsScreen(),
        MerketDataScreen(),
        CoursesScreen(),
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
              image: 'assets/icon_pic/home.png',
              newsName: 'Home',
              index: 0,
            ),
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/smartphone.png',
              newsName: 'Live News',
              index: 1,
            ),
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/report.png',
              newsName: 'Reports',
              index: 2,
            ),
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/market_data.png',
              newsName: 'Market Data',
              index: 3,
            ),
            bottomNavigationBarButton(
              context: context,
              image: 'assets/icon_pic/courses.png',
              newsName: 'Courses',
              index: 4,
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
      return InkWell(
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
              color:
                  isSelected ? AppColor.primaryColor : AppColor.textColorDark,
            ),
            Text(
              newsName,
              style: TextStyle(
                color:
                    isSelected ? AppColor.primaryColor : AppColor.textColorDark,
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    });
  }
}
