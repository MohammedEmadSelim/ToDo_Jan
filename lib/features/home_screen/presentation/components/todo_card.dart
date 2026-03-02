import 'package:flutter/material.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';

class TodoCart extends StatelessWidget {
  const TodoCart({super.key, required this.todo, this.onTap});

  final TodoModel todo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          color: AppColors.pinkRed,
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 21.sp,
                    ),
                  ),
                  Icon(Icons.timelapse, color: AppColors.textWhite),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Flexible(
              child: Text(
                todo.des,
                maxLines: 3,
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 10.h),
              child: Row(
                children: [
                  Text(
                    todo.deadline,
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
