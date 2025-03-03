import 'package:flutter/material.dart';

class RecentlyCoursesProvider extends ChangeNotifier {
  final List<String> _recentlyCoursesCategory = [
    'Overview',
    'Content',
  ];
  List<String> get recentlyCoursesCategory => _recentlyCoursesCategory;

  String _selectedCategory = 'Overview';
  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
