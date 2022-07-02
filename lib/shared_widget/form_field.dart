import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom(
      {Key? key,
      required this.controller,
      required this.hint,
      this.isPassword = false,
      this.minLines = 1,
      this.validator})
      : super(key: key);
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        borderSide: const BorderSide(color: Color(0xFFD4D1D7)));
    return TextFormField(
        validator: validator,
        // minLines: minLines,
        maxLines: minLines,
        controller: controller,
        maxLength: 50,
        style: TextStyle(
            color: CustomColors.dark1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600),
        obscureText: isPassword,
        // autofillHints: const ["@gmail.com", "@yahoo.com"],
        decoration: InputDecoration(
            hintText: hint,
            counterText: "",
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: CustomColors.dark2,
                fontWeight: FontWeight.w400),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: border,
            border: border,
            enabledBorder: border,
            errorBorder: border.copyWith(
                borderSide: const BorderSide(color: CustomColors.red)),
            focusedErrorBorder: border.copyWith(
                borderSide: const BorderSide(color: CustomColors.red))));
  }
}
