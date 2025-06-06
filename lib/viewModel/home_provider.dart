import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/HomeController/home_controller.dart';
import 'package:the_fin_news/model/HomeScreenModels/home_screen_api_res_model.dart';
import 'package:the_fin_news/model/HomeScreenModels/home_screen_carosel_slider_model.dart';
import 'package:the_fin_news/model/LiveNews/live_news_social_items.dart';
import 'package:the_fin_news/model/LiveNews/populer_course_item.dart';
import 'package:the_fin_news/model/LoginModel/global_search_api_res_model.dart';

class HomeProvider extends ChangeNotifier {
  final List<HomeScreenCaroselSliderModel> _homeCarouselImageUrls = [];
  List<HomeScreenCaroselSliderModel> get homeCarouselImageUrls =>
      _homeCarouselImageUrls;

  final List<PopulerCourseItem> _populerCourses = [];
  List<PopulerCourseItem> get populerCourses => _populerCourses;

  final List<PopulerCourseItem> _recenthlyAddedCourses = [];
  List<PopulerCourseItem> get recenthlyAddedCourses => _recenthlyAddedCourses;

  final List<HomeNewsSocialItems> _liveNewsSocialItems = [
    HomeNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/youtube_social_icons.png',
      title: 'Youtube',
    ),
    HomeNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/whatsapp_social_icons.png',
      title: 'Whatsapp',
    ),
    HomeNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/instagram_social_icons.png',
      title: 'Instagram',
    ),
    HomeNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/facebook_social_icons.png',
      title: 'Facebook',
    ),
  ];

  List<HomeNewsSocialItems> get liveNewsSocialItems => _liveNewsSocialItems;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  void updateIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  bool _isHomeDataLoading = false;
  bool get isHomeDataLoading => _isHomeDataLoading;

  bool _isGlobalDataLoading = false;
  bool get isGlobalDataLoading => _isGlobalDataLoading;

  List<Record> _allSuggestions = [];
  List<Record> get allSuggestions => _allSuggestions;

  HomeApiResModel homeApiResModel = HomeApiResModel();
  GlobalSearchApiResModel globalSearchApiResModel = GlobalSearchApiResModel();
  final HomeController _homeController = HomeController();

  void getHomeData() async {
    _isHomeDataLoading = true;
    notifyListeners();
    homeApiResModel = await _homeController.fetchHomeData();
    if (homeApiResModel.status == 200) {
      debugPrint("Home data fetched successfully: ${homeApiResModel.message}");
      _homeCarouselImageUrls.clear();
      _populerCourses.clear();
      _recenthlyAddedCourses.clear();
      homeApiResModel.banner?.forEach(
        (element) {
          debugPrint("Banner ID: ${element.id}, Image: ${element.bannerImg}");
          _homeCarouselImageUrls.add(
            HomeScreenCaroselSliderModel(
              image: element.bannerImg ?? '',
              title: '',
            ),
          );
        },
      );

      homeApiResModel.popularCourses?.forEach(
        (element) {
          debugPrint("Popular Course ID: ${element.id}, Title: ");
          _populerCourses.add(PopulerCourseItem(
            populerCourseId: element.id ?? '',
            populerImageUrl: element.coursePhoto ?? '',
            populerCourseTitle: element.courseTitle ?? '',
            populerCourseDescription: element.courseDescription ?? '',
            populerCoursePrice: element.courseRegularPrice ?? '',
            populerCourseCategory: element.courseCategory ?? '',
          ));
        },
      );

      homeApiResModel.recentlyCourses?.forEach(
        (element) {
          debugPrint("Popular Course ID: ${element.id}, Title: ");
          _recenthlyAddedCourses.add(PopulerCourseItem(
            populerCourseId: element.id ?? '',
            populerImageUrl: element.coursePhoto ?? '',
            populerCourseTitle: element.courseTitle ?? '',
            populerCourseDescription: element.courseDescription ?? '',
            populerCoursePrice: element.courseRegularPrice ?? '',
            populerCourseCategory: element.courseCategory ?? '',
          ));
        },
      );
      _isHomeDataLoading = false;
      notifyListeners();
    } else {
      debugPrint("Failed to fetch home data: ${homeApiResModel.message}");
      _isHomeDataLoading = false;
    }
    notifyListeners();
  }

  Future<void> getGlobalData(query) async {
    debugPrint("Function is hit");
    _isGlobalDataLoading = true;
    notifyListeners();
    globalSearchApiResModel = await _homeController.getGlobalSearchData(query);
    if (globalSearchApiResModel.status == 200) {
      debugPrint("Step one");
      _allSuggestions.clear();
      debugPrint("Step: ${_allSuggestions.length}");
      globalSearchApiResModel.record?.forEach(
        (element) {
          _allSuggestions.add(Record(
            id: element.id,
            source: element.source,
            title: element.title,
          ));
          notifyListeners();
        },
      );
      _isGlobalDataLoading = false;
      notifyListeners();
    } else {
      debugPrint("Failed to fetch global data: ${globalSearchApiResModel.msg}");
      _isGlobalDataLoading = false;
      notifyListeners();
    }
  }
}
