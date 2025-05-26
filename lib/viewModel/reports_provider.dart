import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/ReportsController/reports_controller.dart';
import 'package:the_fin_news/model/ReportsModels/reports_api_res_model.dart';
import 'package:the_fin_news/model/ReportsModels/reports_model.dart';

class ReportsProvider extends ChangeNotifier {
  final List<String> _reportsCategory = [
    'All',
    'Blog',
    'AI',
    'News',
  ];
  List<String> get reportsCategory => _reportsCategory;

  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  final List<ReportsModel> _reportsItems = [
    ReportsModel(
      reportsImage: 'https://www.itarian.com/images/business-report.jpg',
      reprtsTitle:
          'Co\'s Reusable Generative Ai Solutions Transforming Research Across Industries',
      reportsDuration: '5 mins ago',
      reportsDescription:
          'Co\'s Reusable Generative Ai Solutions Transforming Research Across Industries',
    ),
    ReportsModel(
      reportsImage:
          'https://browntape.com/wp-content/uploads/2017/08/84584187-0a09-437f-a600-70ef86afc97a.jpg',
      reprtsTitle:
          'Deccan Gold Mines: CO Updates On the public consultation process that',
      reportsDuration: '10 mins ago',
      reportsDescription:
          'Deccan Gold Mines: CO Updates On the public consultation process that was with regard to the jonnagiri Gold Project of Geomysore, Thereafter Local Stake holders and public representatives',
    ),
  ];
  List<ReportsModel> get reportsItems => _reportsItems;

  ReportsController _reportsController = ReportsController();
  ReportsApiResModel reportsApiResModel = ReportsApiResModel();

  Future<void> fetchReports() async {
    reportsApiResModel = await _reportsController.getAllReports();
    if (reportsApiResModel.status == 200) {
      _reportsItems.clear();
      reportsApiResModel.record?.forEach(
        (element) {
          _reportsItems.add(ReportsModel(
            reportsImage: element.reportImage ?? '',
            reprtsTitle: element.reportTitle ?? '',
            reportsDuration: '5 min ago',
            reportsDescription: element.reportDescription ?? '',
          ));
        },
      );
      notifyListeners();
    } else {
      debugPrint('Failed to fetch reports: ${reportsApiResModel.msg}');
    }
  }
}
