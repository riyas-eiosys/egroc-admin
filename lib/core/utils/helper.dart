import 'dart:io';

import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchURL(url);
  } else {
    return "Can't open the url";
  }
}

Future<File?> pickImage(ImageSource source, BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(
    source: source,
  );

  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

Future<File?> cropImage(
  File image, {
  List<CropAspectRatioPreset> aspectRatioPresets = const [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio16x9,
  ],
  CropAspectRatio? cropAspectRatio,
  CropStyle cropStyle = CropStyle.rectangle,
}) async {
  return ImageCropper().cropImage(
    sourcePath: image.path,
    aspectRatioPresets: aspectRatioPresets,
    aspectRatio: cropAspectRatio,
    androidUiSettings: const AndroidUiSettings(
      toolbarTitle: 'Crop Image',
      toolbarColor: CustomColors.dark1,
      toolbarWidgetColor: CustomColors.green,
      initAspectRatio: CropAspectRatioPreset.square,
      lockAspectRatio: true,
    ),
    iosUiSettings: const IOSUiSettings(
      title: 'Crop Image',
    ),
    cropStyle: cropStyle,
  );
}

statusBarColor({Color? color}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color ?? CustomColors.liteBlue,
    statusBarIconBrightness: Brightness.dark,
  ));
}
