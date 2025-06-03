import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/LiveNewsController/live_news_controller.dart';
import 'package:the_fin_news/model/LiveNews/live_news_api_res_model.dart';
import 'package:the_fin_news/model/LiveNews/live_news_category_api_res_model.dart';
import 'package:the_fin_news/model/LiveNews/live_news_items.dart';

class LiveNewsProvider extends ChangeNotifier {
  final List<LiveNewsItems> _liveNewsItems = [];
  List<LiveNewsItems> get liveNewsItems => _liveNewsItems;

  final List<String> _liveNewsCategory = ['All'];
  List<String> get liveNewsCategory => _liveNewsCategory;

  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  String _selectedCategoryId = "";
  String get selectedCategoryId => _selectedCategoryId;

  void selectCategory(String category) {
    if (category != "All") {
      _selectedCategory = category;
      _selectedCategoryId = liveNewsTypeApiResModel.record
              ?.firstWhere(
                (element) => element.livenewsCateName == category,
              )
              .id ??
          "";
      notifyListeners();
      fetchLiveNewsData(_selectedCategoryId, _selectedCategory);
    } else {
      _selectedCategory = category;
      notifyListeners();
      fetchLiveNewsData("", "");
    }
  }

  bool _isLiveNewsLoading = false;
  bool get isLiveNewsLoading => _isLiveNewsLoading;

  final LiveNewsController _liveNewsController = LiveNewsController();
  LiveNewsDataApiResModel liveNewsDataApiResModel = LiveNewsDataApiResModel();
  LiveNewsTypeApiResModel liveNewsTypeApiResModel = LiveNewsTypeApiResModel();

  /// fetch live news data
  void fetchLiveNewsData(liveNewsCategoryId, liveNewsCategoryName) async {
    _isLiveNewsLoading = true;
    notifyListeners();
    liveNewsDataApiResModel = await _liveNewsController.getLiveNewsData(
      liveNewsCategoryId: liveNewsCategoryId,
      liveNewsCateName: liveNewsCategoryName,
    );
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
      _liveNewsItems.clear();
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
      fetchLiveNewsData("", "");
      notifyListeners();
    } else {
      // Handle the case where the API call was not successful
      debugPrint(
          'Failed to fetch live news category: ${liveNewsTypeApiResModel.msg}');
    }
  }
}
