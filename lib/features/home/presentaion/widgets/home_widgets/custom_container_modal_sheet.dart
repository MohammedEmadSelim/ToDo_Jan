import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/home/data/models/todo_param.dart';
import 'package:to_do_app/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_button_modal_sheet.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_modal_text_form_field.dart';
import '../../../../../core/responsive/responsive_extension.dart';
import '../../../../../core/theme/app_color.dart';

class CustomContainerModalSheet extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController deadLineController;
  final TextEditingController addImageController;
  final File? pickedImage;

  CustomContainerModalSheet({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.deadLineController,
    required this.addImageController,
    this.pickedImage,
  });

  @override
  State<CustomContainerModalSheet> createState() =>
      _CustomContainerModalSheetState();
}

class _CustomContainerModalSheetState extends State<CustomContainerModalSheet> {
  File? pickedImage;

  @override
  void initState() {
    pickedImage = widget.pickedImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        color: AppColor.kPurple1,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                ),
              ),
              ///////////title////////////////
              CustomModalTextFormField(
                title: "title".tr(),
                maxLines: 1,
                textIconBorder: AppColor.kWhite,
                controller: widget.titleController,
              ),
              SizedBox(height: 20.h),
              ///////////description////////////////
              CustomModalTextFormField(
                title: "description".tr(),
                maxLines: 15,
                textIconBorder: AppColor.kWhite,
                controller: widget.descriptionController,
              ),
              SizedBox(height: 20.h),
              ///////////deadLine////////////////
              CustomModalTextFormField(
                onTap: () async {
                  var picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    var formatted = DateFormat('dd MMMM yyyy').format(picked);
                    setState(() {
                      widget.deadLineController.text = formatted;
                    });
                  }
                },
                title: "deadline(Optional)".tr(),
                readOnly: true,
                maxLines: 1,
                textIconBorder: AppColor.lightPink,
                prefixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: AppColor.lightPink,
                ),
                controller: widget.deadLineController,
              ),
              SizedBox(height: 20.h),
              ///////////pickedImage////////////////
              CustomModalTextFormField(
                onTap: () async {
                  var imagePicker = ImagePicker();
                  var image = await imagePicker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    pickedImage = File(image.path);
                    setState(() {
                      ///show image name
                      widget.addImageController.text = image.name.toString();
                    });
                  }
                },
                title: "addImage(Optional)".tr(),
                maxLines: 1,
                readOnly: true,
                textIconBorder: AppColor.lightPink,
                prefixIcon: pickedImage != null
                    ? Padding(
                        padding: EdgeInsets.only(top: 2.sp, left: 5.sp),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            pickedImage!,
                            width: 30.w,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Icon(Icons.image_outlined, color: AppColor.lightPink),
                suffixIcon: pickedImage != null
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            pickedImage = null;
                            widget.addImageController.clear();
                          });
                        },
                        icon: Icon(Icons.close, color: AppColor.kRed),
                      )
                    : null,
                controller: widget.addImageController,
              ),
              SizedBox(height: 20.h),
              CustomButtonModalSheet(
                press: () {
                  context.read<HomeCubit>().createTodo(
                    TodoParam(
                      title: widget.titleController.text,
                      des: widget.descriptionController.text,
                      deadline: widget.deadLineController.text,
                      image: pickedImage,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                text: "addToDo".tr(),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
/*import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/home/data/models/todo_param.dart';
import 'package:to_do_app/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_button_modal_sheet.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_modal_text_form_field.dart';
import '../../../../../core/responsive/responsive_extension.dart';
import '../../../../../core/theme/app_color.dart';

class CustomContainerModalSheet extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController deadLineController;

  const CustomContainerModalSheet({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.deadLineController,
  });

  @override
  State<CustomContainerModalSheet> createState() =>
      _CustomContainerModalSheetState();
}

class _CustomContainerModalSheetState
    extends State<CustomContainerModalSheet> {
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        color: AppColor.kPurple1,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              /// drag line
              Container(
                height: 8.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppColor.kWhite,
                  borderRadius: BorderRadius.circular(30.sp),
                ),
              ),

              SizedBox(height: 20.h),

              /// title
              CustomModalTextFormField(
                title: "title".tr(),
                maxLines: 1,
                textIconBorder: AppColor.kWhite,
                controller: widget.titleController,
              ),

              SizedBox(height: 20.h),

              /// description
              CustomModalTextFormField(
                title: "description".tr(),
                maxLines: 6,
                textIconBorder: AppColor.kWhite,
                controller: widget.descriptionController,
              ),

              SizedBox(height: 20.h),

              /// deadline
              CustomModalTextFormField(
                onTap: () async {
                  var picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(const Duration(days: 1)),
                    lastDate: DateTime(2030),
                  );

                  if (picked != null) {
                    var formatted =
                    DateFormat('dd MMMM yyyy').format(picked);

                    setState(() {
                      widget.deadLineController.text = formatted;
                    });
                  }
                },
                title: "deadline(Optional)".tr(),
                readOnly: true,
                maxLines: 1,
                textIconBorder: AppColor.lightPink,
                icon: Icon(Icons.calendar_today_outlined,
                    color: AppColor.lightPink),
                controller: widget.deadLineController,
              ),

              SizedBox(height: 20.h),

              /// pick image
              CustomModalTextFormField(
                onTap: () async {
                  final imagePicker = ImagePicker();
                  final image =
                  await imagePicker.pickImage(source: ImageSource.gallery);

                  if (image != null) {
                    setState(() {
                      pickedImage = File(image.path);
                    });
                  }
                },
                title: "addImage(Optional)".tr(),
                maxLines: 1,
                readOnly: true,
                textIconBorder: AppColor.lightPink,
                icon: Icon(Icons.image_outlined, color: AppColor.lightPink),
                controller: TextEditingController(
                  text: pickedImage != null ? "Image Selected" : "",
                ),
              ),

              /// preview image
              if (pickedImage != null)
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.sp),
                    child: Image.file(
                      pickedImage!,
                      height: 120.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              SizedBox(height: 30.h),

              /// button
              CustomButtonModalSheet(
                press: () {
                  if (widget.titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Title is required")),
                    );
                    return;
                  }

                  context.read<HomeCubit>().createTodo(
                    TodoParam(
                      title: widget.titleController.text,
                      des: widget.descriptionController.text,
                      deadline: widget.deadLineController.text,
                      image: pickedImage,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Task Added Successfully")),
                  );

                  Navigator.of(context).pop();
                },
                text: "addToDo".tr(),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
 */
