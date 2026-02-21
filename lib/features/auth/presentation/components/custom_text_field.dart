import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
   CustomTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.showPassord = false,
  });

  final String hint;
  final TextEditingController controller;
  final bool? showPassord;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
   bool? obsecure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obsecure!,

      decoration: InputDecoration(
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.softGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.softGrey),
        ),
        suffixIcon: widget.showPassord!
            ? GestureDetector(
            onTap: () {
              obsecure = !obsecure!;
              
              setState(() {

              });

            }
            , child: Icon(obsecure!?Icons.visibility_off:Icons.visibility))
            : null,
      ),
    );
  }
}
