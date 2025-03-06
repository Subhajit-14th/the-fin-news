import 'package:flutter/material.dart';

class MerketdataProvider extends ChangeNotifier {
  final List<String> _metketDataHeadingItems = [
    'Blogs',
    'FII-DII',
    'Crop Actions',
    'Deals',
  ];

  List<String> get metketDataHeadingItems => _metketDataHeadingItems;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  /// set market data index
  void setMetketDataIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<Map<String, dynamic>> _marketData = [
    {
      'date': '28 Feb',
      'nifty': {'value': 22124.70, 'change': -420.35, 'percent': -1.86},
      'fiiCash': -11639.0,
      'diiCash': 12308.6,
      'net': 669.60,
      'derivatives': [
        {'type': 'FII Idx Fut', 'value': -2473.5},
        {'type': 'FII Idx Opt', 'value': -3188.5},
        {'type': 'FII Stk Fut', 'value': 3392.4},
        {'type': 'FII Stk Opt', 'value': -2807.1},
      ],
      'netDerivatives': -5076.7,
    },
    {
      'date': '27 Feb',
      'nifty': {'value': 22545.05, 'change': -2.50, 'percent': -0.01},
      'fiiCash': -556.6,
      'diiCash': 1727.1,
      'net': 669.60,
      'derivatives': [
        {'type': 'FII Idx Fut', 'value': -2473.5},
        {'type': 'FII Idx Opt', 'value': -3188.5},
        {'type': 'FII Stk Fut', 'value': 3392.4},
        {'type': 'FII Stk Opt', 'value': -2807.1},
      ],
      'netDerivatives': -5076.7,
    },
  ];

  List<Map<String, dynamic>> get marketData => _marketData;
}
