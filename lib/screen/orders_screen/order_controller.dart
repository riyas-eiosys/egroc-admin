import 'package:dio/dio.dart';
import 'package:e_groccer_admin/core/network_provider/api/api_repo.dart';
import 'package:e_groccer_admin/models/order_model/order_model.dart';
import 'package:e_groccer_admin/shared_widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide Response;

class OrderController extends GetxController {
  List<OrderData> ordersList = [];
  getAllOrders() async {
    ordersList = [];
    await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        indicator: const CircularProgressIndicator());
    await Future.delayed(const Duration(seconds: 3));
    try {
      final Response result = await ApiRepo().getOrders();

      if (result.statusCode == 200) {
        if (result.data != null) {
          ordersList = [];
          result.data['data'].forEach((v) {
            ordersList.add(OrderData.fromJson(v));
          });
          update();
          print("Success");
        }
        await EasyLoading.dismiss();
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
