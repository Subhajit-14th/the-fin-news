import 'package:flutter/material.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';

class HomeCaroselSliderDetails extends StatelessWidget {
  const HomeCaroselSliderDetails(
      {super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Carosel Slider Details
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),

            /// Carosel Slider Title
            Text(
              title,
              style: TextStyle(
                color: AppColor.textColorDark,
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            /// Carosel Slider Description
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(
                color: AppColor.textColorDark,
                fontSize: 18,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
