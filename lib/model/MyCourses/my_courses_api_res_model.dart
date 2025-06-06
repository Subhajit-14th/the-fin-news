class StudentWiseBatchCourseApiResModel {
  String? message;
  int? status;
  Record? record;

  StudentWiseBatchCourseApiResModel({this.message, this.status, this.record});

  StudentWiseBatchCourseApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? batchId;
  String? batchStartDate;
  String? batchEndDate;
  String? studentName;
  List<Courses>? courses;

  Record(
      {this.batchId,
      this.batchStartDate,
      this.batchEndDate,
      this.studentName,
      this.courses});

  Record.fromJson(Map<String, dynamic> json) {
    batchId = json['batch_id'];
    batchStartDate = json['batch_start_date'];
    batchEndDate = json['batch_end_date'];
    studentName = json['student_name'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batch_id'] = batchId;
    data['batch_start_date'] = batchStartDate;
    data['batch_end_date'] = batchEndDate;
    data['student_name'] = studentName;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  String? courseId;
  String? courseTitle;
  String? courseDescription;
  String? coursePhoto;

  Courses(
      {this.courseId,
      this.courseTitle,
      this.courseDescription,
      this.coursePhoto});

  Courses.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseTitle = json['course_title'];
    courseDescription = json['course_description'];
    coursePhoto = json['course_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['course_title'] = courseTitle;
    data['course_description'] = courseDescription;
    data['course_photo'] = coursePhoto;
    return data;
  }
}
