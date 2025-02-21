import 'package:flutter/material.dart';

class ScreenRouteProvider extends ChangeNotifier {
  int _currntCount = 0;
  int get currentCount => _currntCount;

  final List<String> _screenNames = [
    'Live News',
    'Reports',
    'Market Data',
    'Courses'
  ];
  List<String> get screenNames => _screenNames;

  /// set screen route
  void setScreenRoute(int index) {
    _currntCount = index;
    notifyListeners();
  }
}
