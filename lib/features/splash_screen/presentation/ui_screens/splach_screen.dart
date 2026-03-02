import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/login_screen.dart';
import 'package:todo_app/features/auth/presentation/ui_screens/register_screen.dart';
import 'package:todo_app/features/home_screen/presentation/conrollers/home_cubit/home_cubit.dart';
import 'package:todo_app/features/home_screen/presentation/ui_screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (_) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (_) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    print(3.h);
    return Scaffold(
      backgroundColor: AppColors.softPink,
      body: Center(child: SvgPicture.asset('assets/images/Logo.svg')),
    );
  }
}
