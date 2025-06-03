class HomeApiResModel {
  int? status;
  String? message;
  List<Banner>? banner;
  List<PopularCourses>? popularCourses;
  List<RecentlyCourses>? recentlyCourses;

  HomeApiResModel(
      {this.status,
      this.message,
      this.banner,
      this.popularCourses,
      this.recentlyCourses});

  HomeApiResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
    if (json['popular_courses'] != null) {
      popularCourses = <PopularCourses>[];
      json['popular_courses'].forEach((v) {
        popularCourses!.add(new PopularCourses.fromJson(v));
      });
    }
    if (json['recently_courses'] != null) {
      recentlyCourses = <RecentlyCourses>[];
      json['recently_courses'].forEach((v) {
        recentlyCourses!.add(new RecentlyCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    if (popularCourses != null) {
      data['popular_courses'] = popularCourses!.map((v) => v.toJson()).toList();
    }
    if (recentlyCourses != null) {
      data['recently_courses'] =
          recentlyCourses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  String? id;
  String? bannerImg;

  Banner({this.id, this.bannerImg});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImg = json['banner_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner_img'] = bannerImg;
    return data;
  }
}

class PopularCourses {
  String? id;
  String? courseCategory;
  String? courseTitle;
  String? courseDescription;
  String? courseRegularPrice;
  String? courseDiscountPrice;
  String? coursePhoto;

  PopularCourses(
      {this.id,
      this.courseCategory,
      this.courseTitle,
      this.courseDescription,
      this.courseRegularPrice,
      this.courseDiscountPrice,
      this.coursePhoto});

  PopularCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCategory = json['course_category'];
    courseTitle = json['course_title'];
    courseDescription = json['course_description'];
    courseRegularPrice = json['course_regular_price'];
    courseDiscountPrice = json['course_discount_price'];
    coursePhoto = json['course_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_category'] = courseCategory;
    data['course_title'] = courseTitle;
    data['course_description'] = courseDescription;
    data['course_regular_price'] = courseRegularPrice;
    data['course_discount_price'] = courseDiscountPrice;
    data['course_photo'] = coursePhoto;
    return data;
  }
}

class RecentlyCourses {
  String? id;
  String? courseCategory;
  String? courseTitle;
  String? courseDescription;
  String? courseRegularPrice;
  String? courseDiscountPrice;
  String? coursePhoto;

  RecentlyCourses(
      {this.id,
      this.courseCategory,
      this.courseTitle,
      this.courseDescription,
      this.courseRegularPrice,
      this.courseDiscountPrice,
      this.coursePhoto});

  RecentlyCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCategory = json['course_category'];
    courseTitle = json['course_title'];
    courseDescription = json['course_description'];
    courseRegularPrice = json['course_regular_price'];
    courseDiscountPrice = json['course_discount_price'];
    coursePhoto = json['course_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_category'] = courseCategory;
    data['course_title'] = courseTitle;
    data['course_description'] = courseDescription;
    data['course_regular_price'] = courseRegularPrice;
    data['course_discount_price'] = courseDiscountPrice;
    data['course_photo'] = coursePhoto;
    return data;
  }
}
