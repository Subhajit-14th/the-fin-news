import 'package:flutter/material.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.onTap});

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.textColorLight,
      readOnly: onTap == null ? false : true,
      style: const TextStyle(
        color: AppColor.textColorLight,
      ),
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.textColorLight,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColor.textColorLight,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusColor: AppColor.textColorLight,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textColorLight,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textColorLight,
          ),
        ),
      ),
    );
  }
}
