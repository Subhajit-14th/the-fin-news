class NormalCourseDetailsApiResModel {
  String? msg;
  int? status;
  Course? course;
  List<Videos>? videos;

  NormalCourseDetailsApiResModel(
      {this.msg, this.status, this.course, this.videos});

  NormalCourseDetailsApiResModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  int? id;
  String? courseCategory;
  String? courseTitle;
  String? courseDescription;
  String? coursePhoto;

  Course(
      {this.id,
      this.courseCategory,
      this.courseTitle,
      this.courseDescription,
      this.coursePhoto});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCategory = json['course_category'];
    courseTitle = json['course_title'];
    courseDescription = json['course_description'];
    coursePhoto = json['course_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_category'] = courseCategory;
    data['course_title'] = courseTitle;
    data['course_description'] = courseDescription;
    data['course_photo'] = coursePhoto;
    return data;
  }
}

class Videos {
  String? chapter;
  String? videoUrl;

  Videos({this.chapter, this.videoUrl});

  Videos.fromJson(Map<String, dynamic> json) {
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
