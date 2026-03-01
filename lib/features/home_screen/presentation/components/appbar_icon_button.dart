import 'package:flutter/material.dart';
import 'package:todo_app/core/responsive/responive_extention.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({super.key, this.onTap, required this.icon});

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 32.h),
    );
  }
}
