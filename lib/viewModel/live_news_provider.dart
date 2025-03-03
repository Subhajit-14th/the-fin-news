import 'package:flutter/material.dart';
import 'package:the_fin_news/model/LiveNews/live_news_items.dart';

class LiveNewsProvider extends ChangeNotifier {
  final List<LiveNewsItems> _liveNewsItems = [
    LiveNewsItems(
      liveNewsTitle:
          'Co\'s Reusable Generative Ai Solutions Transforming Research Across Industries',
      liveNewsTime: '13 mins ago',
      liveNewsCategory: 'Equity',
    ),
    LiveNewsItems(
      liveNewsTitle:
          'Deccan Gold Mines: CO Updates On the public consultation process that was with regard to the jonnagiri Gold Project of Geomysore, Thereafter Local Stake holders and public representatives',
      liveNewsTime: '20 mins ago',
      liveNewsCategory: 'Equity',
    ),
  ];

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
}
