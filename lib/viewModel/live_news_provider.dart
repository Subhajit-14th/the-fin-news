import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/LiveNewsController/live_news_controller.dart';
import 'package:the_fin_news/model/LiveNews/live_news_api_res_model.dart';
import 'package:the_fin_news/model/LiveNews/live_news_category_api_res_model.dart';
import 'package:the_fin_news/model/LiveNews/live_news_items.dart';

class LiveNewsProvider extends ChangeNotifier {
  final List<LiveNewsItems> _liveNewsItems = [];
  List<LiveNewsItems> get liveNewsItems => _liveNewsItems;

  final List<String> _liveNewsCategory = [
    'All',
    'Results',
    'Block Deals',
    'Economics'
  ];

  List<String> get liveNewsCategory => _liveNewsCategory;

  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  bool _isLiveNewsLoading = false;
  bool get isLiveNewsLoading => _isLiveNewsLoading;

  final LiveNewsController _liveNewsController = LiveNewsController();
  LiveNewsDataApiResModel liveNewsDataApiResModel = LiveNewsDataApiResModel();
  LiveNewsTypeApiResModel liveNewsTypeApiResModel = LiveNewsTypeApiResModel();

  /// fetch live news data
  void fetchLiveNewsData() async {
    _isLiveNewsLoading = true;
    notifyListeners();
    liveNewsDataApiResModel = await _liveNewsController.getLiveNewsData();
    if (liveNewsDataApiResModel.status == 200) {
      _liveNewsItems.clear();
      liveNewsDataApiResModel.record?.forEach(
        (element) {
          _liveNewsItems.add(LiveNewsItems(
            liveNewsTitle: element.livenewsTitle ?? '',
            liveNewsTime: "",
            liveNewsCategory: element.livenewsCategory ?? '',
          ));
        },
      );
      _isLiveNewsLoading = false;
      notifyListeners();
    } else {
      // Handle the case where the API call was not successful
      _isLiveNewsLoading = false;
      debugPrint(
          'Failed to fetch live news data: ${liveNewsDataApiResModel.message}');
    }
    notifyListeners();
  }

  /// fetch live news category
  void fetchLiveNewsCategory() async {
    liveNewsTypeApiResModel = await _liveNewsController.getLiveNewsCategory();
    if (liveNewsTypeApiResModel.status == 200) {
      _liveNewsCategory.clear();
      _liveNewsCategory.add('All');
      liveNewsTypeApiResModel.record?.forEach(
        (element) {
          _liveNewsCategory.add(element.livenewsCateName ?? '');
        },
      );
      notifyListeners();
    } else {
      // Handle the case where the API call was not successful
      debugPrint(
          'Failed to fetch live news category: ${liveNewsTypeApiResModel.msg}');
    }
  }
}
