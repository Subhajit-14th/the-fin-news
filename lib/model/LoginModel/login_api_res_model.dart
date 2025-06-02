class LoginApiResModel {
  String? msg;
  bool? success;
  Data? data;

  LoginApiResModel({this.msg, this.success, this.data});

  LoginApiResModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    success = json['success'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['success'] = success;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? studentID;
  int? batchId;
  String? name;
  String? email;
  String? token;

  Data({this.studentID, this.batchId, this.name, this.email, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    studentID = json['StudentID'];
    batchId = json['batch_id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StudentID'] = studentID;
    data['batch_id'] = batchId;
    data['name'] = name;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
