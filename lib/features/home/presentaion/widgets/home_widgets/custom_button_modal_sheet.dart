import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import '../../../../../core/responsive/responsive_extension.dart';

class CustomButtonModalSheet extends StatelessWidget {
  const CustomButtonModalSheet({super.key,
    required this.press,
    required this.text});

  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 400.h,
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child:TextButton(onPressed: press,
          child: Text(text,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp,color: AppColor.kPurple1,letterSpacing: 3.sp),)) ,
    );
  }
}
