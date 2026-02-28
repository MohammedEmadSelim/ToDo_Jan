import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/home_screen/presentation/components/todo_read_only%20_fiedl.dart';
import 'package:todo_app/features/home_screen/presentation/ui_screens/home_screen.dart';


class SelectImageWidget extends StatefulWidget {
   SelectImageWidget({super.key, required this.deadLineController,  this.image, required this.onChanged});

  final TextEditingController deadLineController;
   File? image;
   final ValueChanged<File?> onChanged;

  @override
  State<SelectImageWidget> createState() => _SelectImageWidgetState();
}

class _SelectImageWidgetState extends State<SelectImageWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.image != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(),
              ClipRRect(
                borderRadius: BorderRadius.circular(21.r),
                child: Stack(
                  children: [
                    Image.file(
                      widget.image!,
                      height: 80.h,
                      width: 100.w,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 4,
                      child: GestureDetector(
                        onTap: (){
                          widget.image = null ;
                          setState(() {

                          });
                        },
                        child: Icon(
                          Icons.remove_circle_sharp,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),
            ],
          ),
        ToDoReadOnlyTextField(
          title: "add_image_optional".tr(),
          controller: widget.deadLineController,
          icon: Icon(Icons.image_outlined, color: AppColors.veryLightGrey),
          onTap: () async {
            var imagePicker = ImagePicker();
            var res = await imagePicker.pickImage(source: ImageSource.gallery);
            if (res != null) {
              widget.image = File(res.path);
              widget.onChanged(File(res.path));
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
