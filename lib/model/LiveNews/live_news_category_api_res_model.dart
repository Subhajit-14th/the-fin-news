class LiveNewsTypeApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  LiveNewsTypeApiResModel({this.msg, this.status, this.record});

  LiveNewsTypeApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? livenewsCateName;

  Record({this.id, this.livenewsCateName});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    livenewsCateName = json['livenews_cate_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['livenews_cate_name'] = livenewsCateName;
    return data;
  }
}
