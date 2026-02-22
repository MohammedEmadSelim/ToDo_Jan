import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/components/custom_text_field.dart';
import 'package:todo_app/features/auth/presentation/controllers/auth_cubit/auth_cubit.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              if (context.locale == Locale('ar')) {
                context.setLocale(Locale('en'));
              } else {
                context.setLocale(Locale('ar'));
              }
            },
            child: Row(
              children: [
                Text(
                  "locale".tr(),
                  style: TextStyle(
                    color: AppColors.pinkRed,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.pinkRed,
                  size: 27,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Form(
          key: formKey,
          child: Column(
              children: [
              SizedBox(height: 90),
          SvgPicture.asset('assets/images/Logo.svg'),
          SizedBox(height: 12),

          CustomTextFormField(
            validator: (value) {
            if(value ==null || value.isEmpty){
              return "this field can\'t be empty";
            }
            if( !value.contains('@')||!value.contains('.com')){
              return "please enter valid email ";
            }

            return null;
            },
            hint: "email".tr(),
            controller: _emailController,
          ),
          SizedBox(height: 12),

          CustomTextFormField(

              hint: "full_name".tr(),
          controller: _fullNameController,
        ),
        SizedBox(height: 12),

        CustomTextFormField(
          hint: "password".tr(),
          controller: _passwordController,
          showPassord: true,
        ),
        SizedBox(height: 12),

        CustomTextFormField(
          hint: "confirm_password".tr(),
          controller: _confirmPasswordController,
          showPassord: true,
        ),

        SizedBox(height: 10.h),
        CustomButton(
          onTap: () {
            if (!formKey.currentState!.validate()) {
              context.read<AuthCubit>().createUser(
                _emailController.text,
                _passwordController.text,
              );
            }
          },
          title: 'sign_up'.tr(),
          buttonBackgroundColor: AppColors.pinkRed,
          testColor: AppColors.textWhite,
        ),
        SizedBox(height: 21.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'have_account'.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.mediumGrey,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (_) => false,
                );
              },
              child: Text(
                'sign_in'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: AppColors.pinkRed,
                ),
              ),
            ),
          ],
        ),
        ],
      ),
    ),)
    ,
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.buttonBackgroundColor,
    required this.testColor,
    required this.onTap,
  });

  final String title;
  final Color buttonBackgroundColor;
  final Color testColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 450.w,
        height: 55.h,
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w600,
              color: testColor,
            ),
          ),
        ),
      ),
    );
  }
}
