class MyCourseDetailsApiResModel {
  String? message;
  int? status;
  Record? record;

  MyCourseDetailsApiResModel({this.message, this.status, this.record});

  MyCourseDetailsApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    record = json['record'] != null ? Record.fromJson(json['record']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (record != null) {
      data['record'] = record!.toJson();
    }
    return data;
  }
}

class Record {
  String? courseId;
  String? courseTitle;
  String? courseDescription;
  List<Courses>? courses;

  Record(
      {this.courseId, this.courseTitle, this.courseDescription, this.courses});

  Record.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseTitle = json['course_title'];
    courseDescription = json['course_description'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['course_title'] = courseTitle;
    data['course_description'] = courseDescription;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  String? chapter;
  String? videoUrl;

  Courses({this.chapter, this.videoUrl});

  Courses.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'];
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chapter'] = chapter;
    data['video_url'] = videoUrl;
    return data;
  }
}
