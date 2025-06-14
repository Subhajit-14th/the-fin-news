import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_fin_news/model/MarketModel/market_data_category_api_res_model.dart';
import 'package:http/http.dart' as http;
import 'package:the_fin_news/model/MarketModel/market_data_list_api_res_model.dart';

class MarketController {
  Future<MarketDataCategoryApiResModel> getMarketCategory() async {
    MarketDataCategoryApiResModel marketDataCategoryApiResModel =
        MarketDataCategoryApiResModel();
    try {
      var headers = {'Authorization': 'Basic Og=='};
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/market-data-category-api-list.php'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        marketDataCategoryApiResModel =
            MarketDataCategoryApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint('Market Data category api error: $e');
    }
    return marketDataCategoryApiResModel;
  }

  /// get market data
  Future<MarketDataApiResModel> getMarketData() async {
    MarketDataApiResModel marketDataApiResModel = MarketDataApiResModel();
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://smartstylin.in/fin/admin/market-data-list-api.php'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        debugPrint("jsonData: ${jsonData.toString()}");
        marketDataApiResModel =
            MarketDataApiResModel.fromJson(jsonDecode(jsonData));
      } else {
        debugPrint(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint('Market Data list api error: $e');
    }
    return marketDataApiResModel;
  }
}
