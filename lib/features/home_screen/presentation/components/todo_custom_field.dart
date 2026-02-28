
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';

class ToDoCustomTextField extends StatelessWidget {
  const ToDoCustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.maxLines,
  });

  final String title;

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 21.sp,
          color: AppColors.textWhite,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textWhite),
          borderRadius: BorderRadius.circular(21.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textWhite),
          borderRadius: BorderRadius.circular(21.r),
        ),
      ),
    );
  }
}