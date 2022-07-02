import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      this.buttonColor,
      this.child,
      this.elevation,
      this.height,
      this.onPressed,
      this.textColor,
      this.borderColor,
      this.borderRadius,
      this.fontSize,
      this.fontWeight,
      this.width})
      : super(key: key);
  final double? elevation;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Widget? child;
  final String text;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      elevation: elevation ?? 0,
      disabledColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.sp),
          side: (borderColor != null)
              ? BorderSide(color: borderColor!, width: 1)
              : BorderSide.none),
      height: height ?? 48.sp,
      color: buttonColor ?? CustomColors.blue,
      minWidth: width ?? (Get.mediaQuery.size.width * 0.4),
      onPressed: onPressed,
      textColor: textColor ?? CustomColors.dark3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          child ?? const Offstage(),
          if (child != null)
            SizedBox(
              width: 6.sp,
            ),
          Text(
            text,
            style: TextStyle(
                fontSize: fontSize ?? 14.sp,
                fontWeight: fontWeight ?? FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
