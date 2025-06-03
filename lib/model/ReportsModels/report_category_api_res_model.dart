class ReportCategoryApiResModel {
  String? message;
  int? status;
  List<Record>? record;

  ReportCategoryApiResModel({this.message, this.status, this.record});

  ReportCategoryApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['record'] != null) {
      record = <Record>[];
      json['record'].forEach((v) {
        record!.add(Record.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  String? id;
  String? categoryName;

  Record({this.id, this.categoryName});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category name'] = categoryName;
    return data;
  }
}
