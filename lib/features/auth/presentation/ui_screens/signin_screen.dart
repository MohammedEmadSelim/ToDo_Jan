import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:to_do_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import '../../../../core/responsive/responsive_extension.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/appbar_signin_register.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformffield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppbarSigninRegister(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 70.h),
                SvgPicture.asset("assets/logo.svg"),
                SizedBox(height: 140.h),

                // Email Field
                CustomTextformffield(
                  hint: "email".tr(),
                  label: "email".tr(),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "emailRequired".tr(); // "Email is required"
                    }
                    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                        .hasMatch(value)) {
                      return "emailInvalid".tr(); // "Invalid email"
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                // Password Field
                CustomTextformffield(
                  hint: "password".tr(),
                  label: "password".tr(),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "passwordRequired".tr();
                    }
                    if (value.length < 6) {
                      return "passwordMinLength".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("changepassword");
                      },
                      child: Text(
                        "forgPass".tr(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.kGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),

                // Bloc + Button
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSignInSuccess) {
                      Navigator.of(context).pushNamed("home");
                    }
                  },
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthSignInLoading) {
                        return CircularProgressIndicator();
                      }
                      return CustomButton(
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                              _emailController.text,
                              _passwordController.text,
                              "name",
                            );
                          }
                        },
                        text: "signIn".tr(),
                      );
                    },
                  ),
                ),

                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "dontHaveAnAccount".tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kGrey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("signup");
                      },
                      child: Text(
                        "SignUp".tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.kPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}