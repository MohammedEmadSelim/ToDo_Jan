import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';

class AppbarHomeAddtodo extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHomeAddtodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:15.h),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.kWhite,
        actionsPadding: EdgeInsetsGeometry.symmetric(horizontal: 25.sp),
        leadingWidth: 130.sp,
        leading: SvgPicture.asset("assets/logo_icon.svg",),
        actions: [
          InkWell(onTap: (){
            Navigator.of(context).pushNamed("profile");
          },child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:10.sp),
            child: SvgPicture.asset("assets/Vector.svg",width: 30.w,),
          ))
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(80.h);
}
