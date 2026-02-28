import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/register_screen.dart';
import 'package:todo_app/features/home_screen/presentation/components/select_image_widget.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_custom_field.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_read_only%20_fiedl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController desController = TextEditingController();

  final TextEditingController deadLineController = TextEditingController();
  File? todoImage;

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
                child: SingleChildScrollView(
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
                      SizedBox(height: 24.h),

                      // image , sized bix,
                      SelectImageWidget(deadLineController: deadLineController,image: todoImage,onChanged: (image){
                        todoImage = image;
                      },),
                      SizedBox(height: 24.h),

                      CustomButton(
                        title: 'add_todo'.tr(),
                        buttonBackgroundColor: AppColors.textWhite,
                        testColor: AppColors.softPink,
                        onTap: () {
                          titleController.text;
                          desController.text;
                          deadLineController.text;
                          todoImage;
                          print(todoImage?.path);
                        },
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
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
