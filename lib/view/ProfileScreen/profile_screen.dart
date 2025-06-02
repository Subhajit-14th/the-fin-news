import 'package:flutter/material.dart';
import 'package:the_fin_news/services/hive_database.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/utils/widgets/common_button.dart';
import 'package:the_fin_news/utils/widgets/common_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColor.textColorDark,
            fontSize: 20,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                'https://www.shareicon.net/data/512x512/2016/07/26/802043_man_512x512.png',
              ),
            ),
            SizedBox(height: 16),
            CommonTextField(
              labelText: '${HiveDatabase.getUserName()}',
              hintText: "${HiveDatabase.getUserName()}",
              controller: TextEditingController(),
            ),
            SizedBox(height: 16),
            CommonTextField(
              labelText: '${HiveDatabase.getUserEmail()}',
              hintText: "${HiveDatabase.getUserEmail()}",
              controller: TextEditingController(),
            ),
            SizedBox(height: 20),
            CommonButton(
              width: double.infinity,
              buttonText: 'Update Profile',
              buttonColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
