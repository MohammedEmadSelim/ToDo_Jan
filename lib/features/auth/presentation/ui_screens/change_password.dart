import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/responsive/responsive_extension.dart';
import '../../../../core/theme/app_color.dart';
import '../auth_cubit/auth_cubit.dart';
import '../widgets/appbar_signin_register.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformffield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ChangePassword> {
  final _formKey  = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  // bool isShown = false;
  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "passwordRequired".tr();
    }
    if (value.length < 6) {
      return "passwordMinLength".tr();
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "confirmPasswordRequired".tr();
    }
    if (value != passwordController.text) {
      return "passwordsNotMatch".tr();
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhite,
        appBar: AppbarSigninRegister(showLeading: true,),
        body:Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Form(
              key: _formKey ,
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  SvgPicture.asset("assets/logo.svg"),
                  SizedBox(height: 140.h),
                  CustomTextformffield(hint: "password".tr(), label: "password".tr(),obscureText: true,validator: validatePassword,controller: passwordController,),
                  SizedBox(height: 25.h),
                  CustomTextformffield(hint: "confPass".tr(), label:"confPass".tr(),obscureText: true,validator: validateConfirmPassword,controller: confirmController, ),
                  SizedBox(height: 25.h),
                  BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                        if (state is AuthChangePasswordSuccess){
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              icon: Icon(Icons.check_circle,color: AppColor.kGreen,size: 45.sp,),
                              title: Text("changepass".tr(),style: TextStyle(fontSize: 16.sp,color: AppColor.kGreen,fontWeight: FontWeight.w400),),
                              backgroundColor: AppColor.kWhite1,);
                          },);
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacementNamed("signin");
                          });
                        }else if (state is AuthChangePasswordError){
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              icon: Icon(Icons.check_circle,color: AppColor.kGreen,size: 45.sp,),
                              title: Text(state.message,style: TextStyle(fontSize: 16.sp,color: AppColor.kGreen,fontWeight: FontWeight.w400),),
                              backgroundColor: AppColor.kWhite1,);
                          },);
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacementNamed("signin");
                          });
                        }
                         },
                        builder: (context, state) {
                          if (state is AuthChangePasswordLoading) {
                            return const CircularProgressIndicator();
                          }
                          return CustomButton(press: (){
                           if (_formKey.currentState!.validate()){
                              context.read<AuthCubit>().changePassword(
                                  passwordController.text.trim(),
                                  confirmController.text.trim());
                            }
                          }, text: "changePass".tr());
                                },
                                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
