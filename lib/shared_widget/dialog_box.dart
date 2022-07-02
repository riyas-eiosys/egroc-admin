import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> dialogBoxCustoms({required String content, String? title}) {
  return Get.defaultDialog(
      titlePadding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.sp,
      ),
      title: title ?? "Alert",
      radius: 8.sp,
      content: Text(
        content,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
      ));
}
