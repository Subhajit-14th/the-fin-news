class LiveNewsDataApiResModel {
  String? message;
  int? status;
  List<Record>? record;

  LiveNewsDataApiResModel({this.message, this.status, this.record});

  LiveNewsDataApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? livenewsCategory;
  String? livenewsTitle;

  Record({this.id, this.livenewsCategory, this.livenewsTitle});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    livenewsCategory = json['livenews category'];
    livenewsTitle = json['livenews title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['livenews category'] = livenewsCategory;
    data['livenews title'] = livenewsTitle;
    return data;
  }
}
