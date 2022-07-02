import 'package:dio/dio.dart';
import 'package:e_groccer_admin/core/network_provider/api/api_repo.dart';
import 'package:e_groccer_admin/core/shared_preference/shared_preference.dart';
import 'package:e_groccer_admin/screen/main_screen.dart';
import 'package:e_groccer_admin/shared_widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide Response;

class LoginController extends GetxController {
  SharedPreferenceRepo pref = SharedPreferenceRepo.instance;
  login({required String email, required String password}) async {
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    try {
      final Response result =
          await ApiRepo().login(email: email, password: password);

      await EasyLoading.dismiss();
      if (result.statusCode == 200) {
        pref.authToken = result.data["accessToken"];
        pref.isLoggedIn = true;
        Get.to(() => const MainScreen());
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }

    await EasyLoading.dismiss();
  }
}
