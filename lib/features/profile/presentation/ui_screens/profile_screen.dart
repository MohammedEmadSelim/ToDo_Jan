import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:to_do_app/features/profile/presentation/widgets/custom_profile_row_shimmer.dart';
import 'package:to_do_app/features/profile/presentation/proffile_cubit/profile_cubit.dart';
import '../widgets/custom_profile_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColor.kBlack,
            size: 20,
          ),
        ),
        backgroundColor: AppColor.kWhite,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: 30),
            SvgPicture.asset("assets/rafiki.svg"),
            SizedBox(height: 80.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthGetUserDataLoading) {
                  return Column(
                    children: [
                      CustomProfileRowShimmer(),
                      SizedBox(height: 20.h),
                      CustomProfileRowShimmer(),
                      SizedBox(height: 20.h),
                      CustomProfileRowShimmer(),
                      SizedBox(height: 20.h),
                      CustomProfileRowShimmer(),
                      SizedBox(height: 20.h),
                    ],
                  );
                } else if (state is AuthGetUserDataSuccess) {
                  return Column(
                    children: [
                      CustomProfileRow(
                        title: "name".tr(),
                        title1: state.name,
                        press: () {},
                      ),
                      SizedBox(height: 20.h),
                      CustomProfileRow(
                        title: "changeEmail".tr(),
                        title1: state.email,
                        press: () {
                          Navigator.of(context).pushReplacementNamed("signin");
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomProfileRow(
                        title: "changePass".tr(),
                        title1: "********",
                        press: () {
                          Navigator.of(context).pushNamed("changepassword");
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomProfileRow(
                        title: "changeLang".tr(),title1:context.locale == Locale('en')
                ?  "arabic".tr()
                    : "english".tr(),
                        press: () {
                          if (context.locale == Locale('ar')) {
                            context.setLocale(Locale('en'));
                          } else {
                            context.setLocale(Locale('ar'));
                          }
                        },
                      ),
                    ],
                  );
                } else if (state is AuthGetUserDataError) {
                  return CustomProfileRow(title: state.message, press: () {});
                } else {
                  return Column(
                    children: [
                      CustomProfileRow(title: "name".tr(), press: () {}),
                      SizedBox(height: 20.h),
                      CustomProfileRow(title: "changeEmail".tr(), press: () {}),
                      SizedBox(height: 20.h),
                      CustomProfileRow(title: "changePass".tr(), press: () {}),
                      SizedBox(height: 20.h),
                      CustomProfileRow(title: "changeLang".tr(), press: () {}),
                    ],
                  );
                }
              },
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileSignOutSuccess) {
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil("signin", (route) => false);
                    }
                  },
                  builder: (context, state) {
                    if (state is ProfileSignOutLoading) {
                      return CircularProgressIndicator();
                    }
                    return TextButton(
                      onPressed: () {
                        context.read<ProfileCubit>().signOut();
                      },
                      child: Text(
                        "logout".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                          letterSpacing: 1.4.sp,
                          color: AppColor.kPurple,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

