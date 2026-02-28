import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController desController = TextEditingController();

  final TextEditingController deadLineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.pinkRed,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.softPink,
            isScrollControlled: true,
            context: context,
            builder: (context) => Container(
              height: 850.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    ToDoCustomTextField(
                      title: "title".tr(),
                      controller: titleController,
                    ),
                    SizedBox(height: 24.h),

                    ToDoCustomTextField(
                      title: "description".tr(),
                      controller: desController,
                      maxLines: 18,
                    ),
                    SizedBox(height: 24.h),

                    ToDoReadOnlyTextField(
                      title: "deadline_optional".tr(),
                      controller: deadLineController,
                      icon: Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.veryLightGrey,
                      ),
                      onTap: () async {
                        var res = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        );
                        if (res != null) {
                          deadLineController.text = DateFormat(
                            'dd MMMM yyyy',
                          ).format(res);
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add, size: 32.h, color: AppColors.textWhite),
      ),
    );
  }
}

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
