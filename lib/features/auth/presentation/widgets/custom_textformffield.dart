import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import '../../../../core/responsive/responsive_extension.dart';

class CustomTextformffield extends StatefulWidget {
  const CustomTextformffield({
    super.key,
    this.controller,
    required this.hint,
    required this.label,
    this.obscureText = false,
    this.validator
  });

  final TextEditingController? controller;
  final String hint;
  final String label;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<CustomTextformffield> createState() => _CustomTextformffieldState();
}

class _CustomTextformffieldState extends State<CustomTextformffield> {
  bool isShown = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator ,
      obscureText: widget.obscureText ? !isShown : false,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGrey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGrey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGrey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.kGrey,
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.kGrey,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(isShown ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isShown = !isShown;
                  });
                },
              )
            : null,
      ),
    );
  }
}
