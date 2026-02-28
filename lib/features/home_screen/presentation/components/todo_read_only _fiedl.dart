import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';


class ToDoReadOnlyTextField extends StatelessWidget {
  ToDoReadOnlyTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.icon,
    this.onTap,
  });

  final String title;

  final TextEditingController controller;
  final Icon icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.textWhite),
      onTap: onTap,
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: title,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 21.sp,
          color: AppColors.veryLightGrey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.veryLightGrey),
          borderRadius: BorderRadius.circular(21.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.veryLightGrey),
          borderRadius: BorderRadius.circular(21.r),
        ),
      ),
    );
  }
}
