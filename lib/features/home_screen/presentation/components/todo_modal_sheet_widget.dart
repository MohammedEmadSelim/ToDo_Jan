import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/register_screen.dart';
import 'package:todo_app/features/home_screen/data/data_source/home_data_source.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/data/models/todo_param.dart';
import 'package:todo_app/features/home_screen/presentation/components/select_image_widget.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_card.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_custom_field.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_read_only%20_fiedl.dart';
import 'package:todo_app/features/home_screen/presentation/conrollers/home_cubit/home_cubit.dart';
import 'package:todo_app/features/profile/presentation/ui_screens/profile_screen.dart';



class ToDoModalSheetWidget extends StatefulWidget {
  ToDoModalSheetWidget({
    super.key,
    required this.titleController,
    required this.desController,
    required this.deadLineController,
    required this.imageController,
    this.todoImage,
  });

  final TextEditingController titleController;

  final TextEditingController desController;

  final TextEditingController deadLineController;

  final TextEditingController imageController;
  final File? todoImage;

  @override
  State<ToDoModalSheetWidget> createState() => _ToDoModalSheetWidgetState();
}

class _ToDoModalSheetWidgetState extends State<ToDoModalSheetWidget> {
  File? todoImage;

  @override
  void initState() {
    todoImage = widget.todoImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              ToDoCustomTextField(
                title: "title".tr(),
                controller: widget.titleController,
              ),
              SizedBox(height: 24.h),

              ToDoCustomTextField(
                title: "description".tr(),
                controller: widget.desController,
                maxLines: 18,
              ),
              SizedBox(height: 24.h),

              ToDoReadOnlyTextField(
                title: "deadline_optional".tr(),
                controller: widget.deadLineController,
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
                    widget.deadLineController.text = DateFormat(
                      'dd MMMM yyyy',
                    ).format(res);
                  }
                },
              ),
              SizedBox(height: 24.h),

              // image , sized bix,
              SelectImageWidget(
                deadLineController: widget.imageController,
                image: todoImage,
                onChanged: (image) {
                  todoImage = image;
                  widget.imageController.text = image?.path?? "";
                },
              ),
              SizedBox(height: 24.h),

              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeCreateTodoSuccess) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is HomeCreateTodoLoading) {
                    return CircularProgressIndicator();
                  }
                  return CustomButton(
                    title: 'add_todo'.tr(),
                    buttonBackgroundColor: AppColors.textWhite,
                    testColor: AppColors.softPink,
                    onTap: () {
                      context.read<HomeCubit>().createTodo(
                        TodoParam(
                          title: widget.titleController.text,
                          des: widget.desController.text,
                          deadline: widget.deadLineController.text,
                          image: todoImage,
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
