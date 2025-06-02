class CourseDetailsApiResModel {
  String? msg;
  int? status;
  Course? course;
  List<Videos>? videos;

  CourseDetailsApiResModel({this.msg, this.status, this.course, this.videos});

  CourseDetailsApiResModel.fromJson(Map<String, dynamic> json) {
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
  int? courseRegularPrice;
  int? courseDiscountPrice;

  Course(
      {this.id,
      this.courseCategory,
      this.courseTitle,
      this.courseDescription,
      this.courseRegularPrice,
      this.courseDiscountPrice});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCategory = json['course_category'];
    courseTitle = json['course_title'];
    courseDescription = json['course_description'];
    courseRegularPrice = json['course_regular_price'];
    courseDiscountPrice = json['course_discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_category'] = courseCategory;
    data['course_title'] = courseTitle;
    data['course_description'] = courseDescription;
    data['course_regular_price'] = courseRegularPrice;
    data['course_discount_price'] = courseDiscountPrice;
    return data;
  }
}

class Videos {
  String? chapter;
  String? videoPath;
  String? videoUrl;

  Videos({this.chapter, this.videoPath, this.videoUrl});

  Videos.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'];
    videoPath = json['video_path'];
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chapter'] = chapter;
    data['video_path'] = videoPath;
    data['video_url'] = videoUrl;
    return data;
  }
}
