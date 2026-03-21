import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/theme/app_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 80),

            Image.asset(
              "assets/images/Logo.png",
              height: 120,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 40),

            const CustomTextField(hint: "Email"),
            const SizedBox(height: 16),

            const CustomTextField(hint: "Full Name"),
            const SizedBox(height: 16),

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
              text: "SIGN UP",
              onPressed: () {},
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}