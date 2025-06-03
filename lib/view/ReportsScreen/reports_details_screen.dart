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
      backgroundColor: AppColor.tertiaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.tertiaryColor,
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
              description,
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
