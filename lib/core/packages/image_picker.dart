import 'dart:io';

import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/helper.dart' as helper;

class FilePickerDialog extends StatelessWidget {
  const FilePickerDialog(
      {Key? key, required this.onFilePicked})
      : super(key: key);

  final ValueChanged<File> onFilePicked;
 
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4.0.sp,
          horizontal: 16.0.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12.0.sp),
            Text(
              'Choose Source',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: CustomColors.dark1,
                  ),
            ),
            SizedBox(height: 12.0.sp),
            _item(
              context,
              icon: IconAssets.gallery,
              label: 'Choose from gallery',
              onTap: () async {
                Navigator.pop(context);
                final pickedImage =
                    await helper.pickImage(ImageSource.gallery, context);
                if (pickedImage != null) {
                  onFilePicked(pickedImage);
                }
              },
            ),
            _item(
              context,
              icon: IconAssets.camera2,
              label: 'Open camera',
              onTap: () async {
                Navigator.pop(context);
                final pickedImage =
                    await helper.pickImage(ImageSource.camera, context);
                if (pickedImage != null) {
                  onFilePicked(pickedImage);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.sp),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: CustomColors.blue,
                height: 25.0.sp,
                width: 25.0.sp,
              ),
              SizedBox(width: 15.0.sp),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: CustomColors.dark1,
                    ),
              ),
            ],
          ),
        ),
      );
}
