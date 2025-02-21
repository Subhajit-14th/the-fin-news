import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class CommonPasswordField extends StatefulWidget {
  const CommonPasswordField({
    super.key,
    required this.labelText,
    required this.hintText,
  });
  final String labelText;
  final String hintText;

  @override
  State<CommonPasswordField> createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  bool isNotShow = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isNotShow,
      cursorColor: AppColor.textColorLight,
      style: const TextStyle(
        color: AppColor.textColorLight,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColor.textColorLight,
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: AppColor.textColorLight,
        ),
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isNotShow = !isNotShow;
            });
          },
          icon: Icon(
            isNotShow ? Icons.visibility_rounded : Icons.visibility_off_rounded,
            color: AppColor.textColorLight,
          ),
        ),
      ),
    );
  }
}
