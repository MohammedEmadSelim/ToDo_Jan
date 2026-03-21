import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import '../../../../core/responsive/responsive_extension.dart';



class CustomProfileRow extends StatelessWidget {
  const CustomProfileRow({super.key, required this.title, required this.press,this.title1});

  final String title;
  final String? title1;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          children: [
            Text(title,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22.sp,letterSpacing: 1.4.sp,color: AppColor.kGrey),),
            Spacer(),
            Text(title1??"",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22.sp,letterSpacing: 1.4.sp,color: AppColor.kPurple1),),
            SizedBox(width: 14.w,),
            Icon(Icons.arrow_forward_ios_outlined,color: AppColor.kGrey)
          ],
        ),
      ),
    );
  }
}
