import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';

void showAlertDialog(BuildContext context, {void Function()? onTap}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'delete_todo'.tr(),
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.red,
        ),
      ),
      content: Text(
        'delete_todo_message'.tr(),
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.mediumGrey,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.red,
            ),
            child: Center(
              child: Text(
                "delete".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 21.sp,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.softGrey),
            ),
            child: Center(
              child: Text(
                "cancel".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 21.sp,
                  color: AppColors.mediumGrey,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
