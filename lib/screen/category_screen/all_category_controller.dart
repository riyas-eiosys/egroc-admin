import 'package:dio/dio.dart';
import 'package:e_groccer_admin/core/network_provider/api/api_repo.dart';
import 'package:e_groccer_admin/models/category_model/datum.dart';
import 'package:e_groccer_admin/shared_widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide Response;

class CategoryController extends GetxController {
  List<CategoryData> categories = [];
  List<CategoryData> subCategories = [];
  bool isEnable = false;
  bool isFeatured = false;
  int priority = 0;
  getAllCategories() async {
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    try {
      final Response result = await ApiRepo().getAllCategories();

      if (result.statusCode == 200) {
        if (result.data != null) {
          categories = [];
          result.data['data'].forEach((v) {
            categories.add(CategoryData.fromJson(v));
          });

          update();
          print("Success");
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
      await EasyLoading.dismiss();
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }
    update();
    await EasyLoading.dismiss();
  }

  getSubCategory({required String id}) async {
    subCategories = [];
    update();
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    try {
      final Response result = await ApiRepo().getSubCategory(id: id);

      if (result.statusCode == 200) {
        if (result.data != null) {
          subCategories = [];
          result.data['data'].forEach((v) {
            subCategories.add(CategoryData.fromJson(v));
          });
          update();
          print("Success");
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
      await EasyLoading.dismiss();
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }
    update();
    await EasyLoading.dismiss();
  }

  addCategory({required Map<String, dynamic> data}) async {
    subCategories = [];
    update();
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    try {
      final Response result = await ApiRepo().addCategory(data: data);

      if (result.statusCode == 200) {
        if (result.data != null) {
          Get.back();
          await getAllCategories();
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
      await EasyLoading.dismiss();
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }

    await EasyLoading.dismiss();
  }

  editCategory({required Map<String, dynamic> data, required int id}) async {
    subCategories = [];
    update();
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    try {
      final Response result = await ApiRepo().editCategory(data: data, id: id);

      if (result.statusCode == 200) {
        if (result.data != null) {
          Get.back();
          await getAllCategories();
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
      await EasyLoading.dismiss();
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }

    await EasyLoading.dismiss();
  }

  addSubCategory({required Map<String, dynamic> data}) async {
    subCategories = [];
    update();

    print("~~~object ${data["parent"]}");
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    try {
      final Response result = await ApiRepo().addSubCategory(data: data);

      if (result.statusCode == 200) {
        if (result.data != null) {
          Get.back();
          await getSubCategory(id: data['parent'].toString());
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
      await EasyLoading.dismiss();
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }

    await EasyLoading.dismiss();
  }

  editSubCategory({required Map<String, dynamic> data, required int id}) async {
    subCategories = [];
    update();
    print("~~~object ${data["parent"]}");
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    try {
      final Response result =
          await ApiRepo().editSubCategory(data: data, id: id);

      if (result.statusCode == 200) {
        if (result.data != null) {
          Get.back();
          await getSubCategory(id: data['parent'].toString());
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
      await EasyLoading.dismiss();
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }

    await EasyLoading.dismiss();
  }
}
