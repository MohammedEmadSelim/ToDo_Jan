import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/theme/app_colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            Image.asset("assets/images/Logo.png", height: 120 , fit: BoxFit.contain),
            const SizedBox(height: 40),


            const CustomTextField(hint: "Email"),
            const SizedBox(height: 16),

            const CustomTextField(
              hint: "Password",
              isPassword: true,
            ),

            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: AppColors.primary),
              ),
            ),

            const SizedBox(height: 24),

            CustomButton(
              text: "SIGN IN",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}