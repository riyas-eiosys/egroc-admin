import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/models/order_model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'button.dart';

class OrderItem extends StatelessWidget {
  OrderItem({Key? key, required this.order}) : super(key: key);
  final OrderData order;

  Color? statusColor;
  String? status;

  @override
  Widget build(BuildContext context) {
    switch (order.status) {
      case "in cart":
        statusColor = CustomColors.orange;
        status = "In Order";
        break;
      case "Order Delivered":
        statusColor = CustomColors.green;
        status = "Order Delivered";
        break;
      case "Order Cancelled":
        statusColor = CustomColors.red;
        status = "Order Cancelled";
        break;

      default:
        statusColor = CustomColors.blue;
        status = "Placed";
        break;
    }
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 14.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: CustomColors.dark3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(11.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("ID: ${order.id}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.dark2)),
                    SizedBox(
                      width: 6.sp,
                    ),
                    Text("|",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.dark2)),
                    SizedBox(
                      width: 6.sp,
                    ),
                    Text("1 day ago",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: CustomColors.dark2)),
                    const Spacer(),
                    PopupMenuButton(
                      onSelected: (value) {
                        // _onMenuItemSelected(value as int);
                      },
                      // offset: Offset(0.0, 26.sp),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx) => [
                        // _buildPopupMenuItem('Edit', 1, IconAssets.edit),
                        // _buildPopupMenuItem(
                        //     (true) ? "Disable Product" : 'Enable Product',
                        //     2,
                        //     IconAssets.disabled),
                      ],
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        // height: 22.sp,
                        // width: 22.sp,
                        padding: EdgeInsets.symmetric(
                            vertical: 6.sp, horizontal: 8.sp),
                        child: SvgPicture.asset(
                          IconAssets.option,
                          height: 16.sp,
                          width: 4.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 2.sp,
                // ),
                Text(
                    (order.ordersProduct?.isEmpty == true)
                        ? "Null"
                        : "${order.ordersProduct?.first.product?.name}",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.dark1)),
                SizedBox(
                  height: 8.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total: ₹${order.total}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.dark1)),
                    dot(),
                    Text("Shipping:₹${order.shippingCharges}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.dark1)),
                    dot(),
                    Text("Grand Total: ₹${order.grandTotal}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.dark1)),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: CustomColors.dark3,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 12.sp, right: 18.sp, top: 8.sp, bottom: 12.sp),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      itemWithIcon(
                          title: "${order.user?.fullName}",
                          icon: SvgPicture.asset(
                            IconAssets.profile,
                            height: 10.sp,
                            width: 7.sp,
                          )),
                      SizedBox(
                        height: 6.sp,
                      ),
                      itemWithIcon(
                          title: "${order.user?.mobileNumber}",
                          icon: SvgPicture.asset(
                            IconAssets.mobile,
                            height: 11.sp,
                            width: 7.sp,
                          )),
                      SizedBox(
                        height: 6.sp,
                      ),
                      itemWithIcon(
                          title: "${order.user?.emailAddress}",
                          icon: SvgPicture.asset(
                            IconAssets.mail,
                            height: 9.sp,
                            width: 10.sp,
                          )),
                    ],
                  ),
                ),
                // const Spacer(),
                CustomButton(
                  text: status ?? "Placed",
                  height: 25.sp,
                  buttonColor: statusColor,
                  width: 110.sp,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  borderRadius: 5.sp,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWithIcon({required String title, required Widget icon}) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 10.sp,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: CustomColors.dark2),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget dot() {
    return Container(
      height: 4.sp,
      width: 4.sp,
      decoration: const BoxDecoration(
          color: CustomColors.dark2, shape: BoxShape.circle),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position, String icon) {
    return PopupMenuItem(
      value: position,
      height: 25.sp,
      child: InkWell(
        onTap: () {
          // controller.enableProduct(
          //     data: {"enabled": (product.enabled == true) ? false : true},
          //     id: product.id!);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 6.sp),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 10.sp,
                width: 10.sp,
                color: CustomColors.dark2,
              ),
              SizedBox(
                width: 6.sp,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
