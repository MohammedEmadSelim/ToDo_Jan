import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import '../../../../../core/responsive/responsive_extension.dart';

class CustomModalTextFormField extends StatelessWidget {
  const CustomModalTextFormField({
    super.key,
    required this.title,
    this.icon,
    required this.maxLines,
    required this.textIconBorder,
    this.readOnly=false,
    required this.controller,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon

  });

  final String title;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final Color textIconBorder;
  final bool readOnly;
  final TextEditingController controller;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap ,
      style: TextStyle(color: AppColor.kWhite,fontWeight: FontWeight.w700),
      controller:controller ,
      readOnly:readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        hint: Text(title,style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 19.r,
          color: textIconBorder,
            letterSpacing: 1
        ),),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: BorderSide(
            width: 2.5,
            color: textIconBorder
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.sp),
            borderSide: BorderSide(
              width: 2,
                color: textIconBorder
            )
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon??icon,
      ),
    );
  }
}

