import 'package:flutter/material.dart';
import 'package:the_fin_news/model/LiveNews/line_news_social_items.dart';
import 'package:the_fin_news/model/LiveNews/populer_course_item.dart';

class LiveNewsProvider extends ChangeNotifier {
  final List<String> _liveNewsImageUrls = [
    'https://snworksceo.imgix.net/dth/73df7e31-b392-4681-a40b-c70ab43cc1d7.sized-1000x1000.jpg?w=1000',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Pollock_to_Hussey.jpg/1200px-Pollock_to_Hussey.jpg',
    'https://thephysiocompany.co.uk/wp-content/uploads/football.jpg',
    'https://bsmedia.business-standard.com/_media/bs/img/article/2023-08/20/full/1692544925-8108.jpg?im=FeatureCrop,size=(826,465)',
  ];

  List<String> get liveNewsImageUrls => _liveNewsImageUrls;

  final List<PopulerCourseItem> _populerCourses = [
    PopulerCourseItem(
      populerImageUrl:
          'https://instructor-academy.onlinecoursehost.com/content/images/2023/05/How-to-Create-an-Online-Course-For-Free--Complete-Guide--6.jpg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
    PopulerCourseItem(
      populerImageUrl:
          'https://wealthcreator.co.in/wp-content/uploads/2022/12/Free-Online-Courses-with-Certificates.jpg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
    PopulerCourseItem(
      populerImageUrl:
          'https://www.educourse.co.za/wp-content/uploads/2024/06/IT-Courses-for-Beginners.jpg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
    PopulerCourseItem(
      populerImageUrl:
          'https://images.shiksha.com/mediadata/images/articles/1576227666phpqUHpt1.jpeg',
      populerCourseTitle: 'C-04 CURRENT AFFAIRES 25-26',
      populerCoursePrice: '₹ 5,009',
    ),
  ];

  List<PopulerCourseItem> get populerCourses => _populerCourses;

  List<LineNewsSocialItems> _liveNewsSocialItems = [
    LineNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/youtube_social_icons.png',
      title: 'Youtube',
    ),
    LineNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/whatsapp_social_icons.png',
      title: 'Whatsapp',
    ),
    LineNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/instagram_social_icons.png',
      title: 'Instagram',
    ),
    LineNewsSocialItems(
      liveNewsSocialImageUrl: 'assets/icon_pic/facebook_social_icons.png',
      title: 'Facebook',
    ),
  ];

  List<LineNewsSocialItems> get liveNewsSocialItems => _liveNewsSocialItems;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  void updateIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}
