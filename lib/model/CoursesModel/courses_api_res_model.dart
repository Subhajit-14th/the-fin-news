class RecentlyCoursesApiResModel {
  String? msg;
  int? status;
  List<Record>? record;

  RecentlyCoursesApiResModel({this.msg, this.status, this.record});

  RecentlyCoursesApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? courseCategory;
  String? courseTitle;
  String? courseRegularPrice;
  String? courseDiscountPrice;
  String? coursePhoto;

  Record(
      {this.id,
      this.courseCategory,
      this.courseTitle,
      this.courseRegularPrice,
      this.courseDiscountPrice,
      this.coursePhoto});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCategory = json['course_category'];
    courseTitle = json['course_title'];
    courseRegularPrice = json['course_regular_price'];
    courseDiscountPrice = json['course_discount_price'];
    coursePhoto = json['course_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_category'] = courseCategory;
    data['course_title'] = courseTitle;
    data['course_regular_price'] = courseRegularPrice;
    data['course_discount_price'] = courseDiscountPrice;
    data['course_photo'] = coursePhoto;
    return data;
  }
}
