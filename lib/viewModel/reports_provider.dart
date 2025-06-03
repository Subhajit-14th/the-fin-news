import 'package:flutter/material.dart';
import 'package:the_fin_news/controllers/ReportsController/reports_controller.dart';
import 'package:the_fin_news/model/ReportsModels/report_category_api_res_model.dart';
import 'package:the_fin_news/model/ReportsModels/reports_api_res_model.dart';
import 'package:the_fin_news/model/ReportsModels/reports_model.dart';

class ReportsProvider extends ChangeNotifier {
  final List<String> _reportsCategory = ['All'];
  List<String> get reportsCategory => _reportsCategory;

  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  String _selectedCategoryId = "";
  String get selectedCategoryId => _selectedCategoryId;

  void selectCategory(String category) {
    if (category != "All") {
      _selectedCategory = category;
      _selectedCategoryId = reportCategoryApiResModel.record
              ?.firstWhere(
                (element) => element.categoryName == category,
              )
              .id ??
          "";
      notifyListeners();
      fetchReports(_selectedCategoryId, _selectedCategory);
    } else {
      _selectedCategory = category;
      notifyListeners();
      fetchReports("", "");
    }
    debugPrint("My selected category is: $_selectedCategory");
    debugPrint("My selected category id is: $_selectedCategoryId");
    // fetchReports(_selectedCategoryId, _selectedCategory);
  }

  final List<ReportsModel> _reportsItems = [];
  List<ReportsModel> get reportsItems => _reportsItems;

  final ReportsController _reportsController = ReportsController();
  ReportsApiResModel reportsApiResModel = ReportsApiResModel();
  ReportCategoryApiResModel reportCategoryApiResModel =
      ReportCategoryApiResModel();

  bool _isReportLoading = false;
  bool get isReportLoading => _isReportLoading;

  /// Get report category
  void fetchReportCategory() async {
    reportCategoryApiResModel = await _reportsController.getReportCategory();
    if (reportCategoryApiResModel.status == 200) {
      _reportsCategory.clear();
      _reportsCategory.add('All');
      reportCategoryApiResModel.record?.forEach(
        (element) {
          _reportsCategory.add("${element.categoryName}");
        },
      );
      notifyListeners();
      fetchReports("", "");
    } else {
      debugPrint('Server error');
    }
  }

  /// Fetch reports list
  Future<void> fetchReports(reportCategoryId, reportCateName) async {
    _isReportLoading = true;
    notifyListeners();
    reportsApiResModel = await _reportsController.getAllReports(
      reportCategoryId: reportCategoryId,
      reportCateName: reportCateName,
    );
    if (reportsApiResModel.status == 200) {
      _reportsItems.clear();
      reportsApiResModel.record?.forEach(
        (element) {
          _reportsItems.add(ReportsModel(
              reportsImage: element.reportImage ?? '',
              reprtsTitle: element.reportTitle ?? '',
              reportsDuration: element.postedTimeAgo ?? '',
              reportsDescription: element.reportDescription ?? '',
              reportsCategory: element.reportCategory ?? ''));
        },
      );
      _isReportLoading = false;
      notifyListeners();
    } else {
      _reportsItems.clear();
      _isReportLoading = false;
      notifyListeners();
      debugPrint('Failed to fetch reports: ${reportsApiResModel.msg}');
    }
  }
}
