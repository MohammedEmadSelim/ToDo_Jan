import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/login_screen.dart';
import 'package:todo_app/features/profile/presentation/controllers/profile_cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(iconTheme: IconThemeData(color: AppColors.pinkRed)),
        body: Column(
          children: [
            SizedBox(height: 40.h),
            SvgPicture.asset('assets/images/rafiki.svg'),
            ProfileTap(title: "name".tr(), onTap: () {}),
            SizedBox(height: 24.h),
            ProfileTap(title: "change_email".tr(), onTap: () {}),
            SizedBox(height: 24.h),
            ProfileTap(title: "change_password".tr(), onTap: () {}),
            SizedBox(height: 24.h),
            ProfileTap(title: "change_language".tr(), onTap: () {}),
            SizedBox(height: 24.h),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileSignOutSuccess) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),),
                      (_)=>false);
                }
              },
              builder: (context, state) {
                if (state is ProfileSignOutLoading) {
                  return CircularProgressIndicator(color: AppColors.pinkRed,);
                }
                return ProfileTap(
                  title: "logout".tr(),
                  onTap: () {
                    context.read<ProfileCubit>().signOut();

                  },
                  enableIcon: false,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26.sp,
                    color: AppColors.pinkRed,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTap extends StatelessWidget {
  const ProfileTap({
    super.key,
    required this.title,
    this.onTap,
    this.enableIcon = true,
    this.textStyle,
  });

  final String title;
  final void Function()? onTap;
  final bool? enableIcon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:
              textStyle ??
                  TextStyle(
                    color: AppColors.mediumGrey,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            if (enableIcon!)
              Icon(Icons.arrow_forward_ios, color: AppColors.mediumGrey),
          ],
        ),
      ),
    );
  }
}
