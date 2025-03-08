import 'package:flutter/material.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';

class ReportsDetailsScreen extends StatelessWidget {
  const ReportsDetailsScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.duration,
      required this.description});

  final String image;
  final String title;
  final String duration;
  final String description;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Reports Image
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

            /// Reports Title
            Text(
              title,
              style: TextStyle(
                color: AppColor.textColorDark,
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),

            /// Reports Duration
            Text(
              duration,
              style: TextStyle(
                color: AppColor.textColorDark,
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),

            /// Reports Description
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
