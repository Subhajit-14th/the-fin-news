import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/MarketController/market_controller.dart';
import 'package:the_fin_news/model/MarketModel/market_data_category_api_res_model.dart';
import 'package:the_fin_news/model/MarketModel/market_data_list_api_res_model.dart'
    as marketdatalist;

class MerketdataProvider extends ChangeNotifier {
  final List<String> _metketDataHeadingCategoryItems = ['All'];
  List<String> get metketDataHeadingCategoryItems =>
      _metketDataHeadingCategoryItems;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  /// set market data index
  void setMetketDataIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<marketdatalist.Record> _marketData = [];
  List<marketdatalist.Record> get marketData => _marketData;

  MarketDataCategoryApiResModel marketDataCategoryApiResModel =
      MarketDataCategoryApiResModel();
  marketdatalist.MarketDataApiResModel marketDataApiResModel =
      marketdatalist.MarketDataApiResModel();
  final MarketController _marketController = MarketController();

  bool _isMarketCateogryLoad = false;
  bool get isMarketCateogryLoad => _isMarketCateogryLoad;

  /// get market category data
  void getMarketCategoryData() async {
    _isMarketCateogryLoad = true;
    notifyListeners();
    marketDataCategoryApiResModel = await _marketController.getMarketCategory();
    if (marketDataCategoryApiResModel.status == 200) {
      _metketDataHeadingCategoryItems.clear();
      _metketDataHeadingCategoryItems.add('All');
      marketDataCategoryApiResModel.record?.forEach(
        (element) {
          _metketDataHeadingCategoryItems.add("${element.categoryName}");
        },
      );
      _isMarketCateogryLoad = false;
      notifyListeners();
    } else {
      _isMarketCateogryLoad = false;
      notifyListeners();
    }
  }

  bool _isMarketDataLoad = false;
  bool get isMarketDataLoad => _isMarketDataLoad;

  /// get market data items
  void getMarketData() async {
    _isMarketDataLoad = true;
    notifyListeners();
    marketDataApiResModel = await _marketController.getMarketData();
    if (marketDataApiResModel.status == 200) {
      _marketData.clear();
      marketDataApiResModel.record?.forEach(
        (element) {
          _marketData.add(element);
        },
      );
      _isMarketDataLoad = false;
      notifyListeners();
    } else {
      _isMarketDataLoad = false;
      notifyListeners();
    }
  }
}
