class ReportsApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  ReportsApiResModel({this.msg, this.status, this.record});

  ReportsApiResModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
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
    data['msg'] = msg;
    data['status'] = status;
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  String? id;
  String? reportCategory;
  String? reportTitle;
  String? reportDescription;
  String? reportImage;
  String? postedTimeAgo;

  Record(
      {this.id,
      this.reportCategory,
      this.reportTitle,
      this.reportDescription,
      this.reportImage,
      this.postedTimeAgo});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportCategory = json['report_category'];
    reportTitle = json['report_title'];
    reportDescription = json['report_description'];
    reportImage = json['report_image'];
    postedTimeAgo = json['posted_time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['report_category'] = reportCategory;
    data['report_title'] = reportTitle;
    data['report_description'] = reportDescription;
    data['report_image'] = reportImage;
    data['posted_time_ago'] = postedTimeAgo;
    return data;
  }
}
