import 'package:dio/dio.dart';
import 'package:e_groccer_admin/core/network_provider/api/api_repo.dart';
import 'package:e_groccer_admin/models/products_model/products_model.dart';
import 'package:e_groccer_admin/shared_widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide Response;

class AllProductController extends GetxController {
  bool isLoading = false;
  List<ProductModel> products = [];
  getAllProducts() async {
    products = [];
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final Response result = await ApiRepo().getAllProducts();

      await EasyLoading.dismiss();
      if (result.statusCode == 200) {
        if (result.data != null) {
          products = [];
          result.data.forEach((v) {
            products.add(ProductModel.fromJson(v));
          });
          update();
          print("Success");
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }
    update();
    await EasyLoading.dismiss();
  }

  enableProduct({required Map<String, dynamic> data, required int id}) async {
    await EasyLoading.show(
      status: 'loading...',
    );
    await Future.delayed(const Duration(seconds: 3));
    try {
      final Response result = await ApiRepo().editProduct(data: data, id: id);

      await EasyLoading.dismiss();
      if (result.statusCode == 200) {
        if (result.data != null) {
          for (int i = 0; i < products.length; i++) {
            if (products[i].id == id) {
              products[i].enabled = data['enabled'];
              print("~Count $i");
              break;
            }
          }
          Get.back();
          update();
          print("Success");
        }
      } else {
        dialogBoxCustoms(content: result.data["message"]);
      }
    } catch (e) {
      dialogBoxCustoms(content: "Something went wrong, Please retry");
    }
    update();
    await EasyLoading.dismiss();
  }
}
