import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/theme/app_colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 40),

            Image.asset(
              "assets/images/Logo.png",
              height: 120,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 40),

            const CustomTextField(
              hint: "Password",
              isPassword: true,
            ),
            const SizedBox(height: 16),

            const CustomTextField(
              hint: "Confirm Password",
              isPassword: true,
            ),

            const SizedBox(height: 30),

            CustomButton(
              text: "CHANGE PASSWORD",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}