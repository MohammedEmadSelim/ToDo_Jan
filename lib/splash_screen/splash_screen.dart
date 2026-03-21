import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value){
      FirebaseAuth.instance.currentUser == null ?
          Navigator.of(context).pushReplacementNamed("signup")
          :Navigator.of(context).pushReplacementNamed("home");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPurple1,
      body: Center(
        child: SvgPicture.asset("assets/logo.svg"),
      ),
    );
  }
}
