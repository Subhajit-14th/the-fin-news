class GlobalSearchApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  GlobalSearchApiResModel({this.msg, this.status, this.record});

  GlobalSearchApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? source;
  String? id;
  String? title;

  Record({this.source, this.id, this.title});

  Record.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
