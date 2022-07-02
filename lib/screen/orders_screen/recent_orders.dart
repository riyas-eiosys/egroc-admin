import 'package:e_groccer_admin/screen/orders_screen/order_controller.dart';
import 'package:e_groccer_admin/shared_widget/appbar.dart';
import 'package:e_groccer_admin/shared_widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecentOrderScreen extends StatelessWidget {
  RecentOrderScreen({Key? key}) : super(key: key);
  OrderController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustoms(
          title: "Recent Orders",
          isSearch: true,
        ),
        body: GetBuilder<OrderController>(builder: (orderController) {
          return ListView.separated(
            itemCount: controller.ordersList.length > 12
                ? 12
                : controller.ordersList.length,
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 24.sp),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10.sp,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return OrderItem(
                order: controller.ordersList[index],
              );
            },
          );
        }));
  }
}
