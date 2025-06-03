import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/services/hive_database.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/utils/widgets/common_button.dart';
import 'package:the_fin_news/utils/widgets/common_text_field.dart';
import 'package:the_fin_news/viewModel/auth_services_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<AuthServices>().updateEmailController.text =
            "${HiveDatabase.getUserEmail()}";
        context.read<AuthServices>().updateNameController.text =
            "${HiveDatabase.getUserName()}";
      },
    );
  }

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
              controller: context.read<AuthServices>().updateNameController,
            ),
            SizedBox(height: 16),
            CommonTextField(
              labelText: '${HiveDatabase.getUserEmail()}',
              hintText: "${HiveDatabase.getUserEmail()}",
              controller: context.read<AuthServices>().updateEmailController,
            ),
            SizedBox(height: 20),
            Consumer<AuthServices>(builder: (context, authServices, child) {
              if (authServices.isUserUpdating) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                );
              }
              return CommonButton(
                width: double.infinity,
                buttonText: 'Update Profile',
                buttonColor: AppColor.primaryColor,
                onTap: () {
                  authServices.updateProfile(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
