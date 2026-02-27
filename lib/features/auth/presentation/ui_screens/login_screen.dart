import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/components/custom_text_field.dart';
import 'package:todo_app/features/auth/presentation/controllers/auth_cubit/auth_cubit.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/register_screen.dart'
    show CustomButton, RegisterScreen;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
        child: Column(
          children: [
            SizedBox(height: 90.h),
            SvgPicture.asset('assets/images/Logo.svg'),
            SizedBox(height: 12),

            CustomTextFormField(
              hint: "email".tr(),
              controller: _emailController,
            ),
            SizedBox(height: 12.h),


            CustomTextFormField(
              hint: "password".tr(),
              controller: _passwordController,
              showPassord: true,
            ),


            SizedBox(height: 10.h),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoginSuccess) {
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomeScreen(),),(_)=>false);
                }
                if (state is AuthLoginFailure){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text( state.message,style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),)));
                }
              },
              builder: (context, state) {
                if(state is AuthLoginLoading){
                  return CircularProgressIndicator();
                }
                return CustomButton(
                  onTap: () {
                    context.read<AuthCubit>().login(_emailController.text, _passwordController.text, 'name');
                  },
                  title: 'sign_in'.tr(),
                  buttonBackgroundColor: AppColors.pinkRed,
                  testColor: AppColors.textWhite,
                );
              },
            ),
            SizedBox(height: 21.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'dont_have_account'.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.mediumGrey,
                  ),
                ),
                GestureDetector(onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RegisterScreen(),));
                }, child: Text('sign_in'.tr(), style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: AppColors.pinkRed,
                ),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
