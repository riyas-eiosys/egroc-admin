import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/screen/orders_screen/order_controller.dart';
import 'package:e_groccer_admin/screen/orders_screen/recent_orders.dart';
import 'package:e_groccer_admin/shared_widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with AutomaticKeepAliveClientMixin<DashBoardScreen> {
  OrderController controller = Get.put(OrderController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getAllOrders();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<OrderController>(builder: (orderController) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 24.sp),
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thu, Feb 27, 2022",
                      style:
                          TextStyle(color: CustomColors.dark2, fontSize: 12.sp),
                    ),
                    Text(
                      "Namaste John!",
                      style: TextStyle(
                          color: CustomColors.dark1,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Spacer(),
                ClipOval(
                    child: Image.asset(
                  ImageAssets.dam,
                  height: 48.sp,
                  width: 48.sp,
                  fit: BoxFit.cover,
                ))
              ],
            ),
            SizedBox(
              height: 12.sp,
            ),

            ///Chart here
            SizedBox(
              height: 16.sp,
            ),
            item1(title: "Product Trending", icon: IconAssets.chart),
            SizedBox(
              height: 12.sp,
            ),
            Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    item2(title: "Top Selling", icon: IconAssets.cartPlus),
                    item2(title: "Most Clicked", icon: IconAssets.mostLiked),
                    item2(title: "Locations", icon: IconAssets.location)
                  ],
                )),
            SizedBox(
              height: 16.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item1(title: "Recent Orders", icon: IconAssets.order),
                InkWell(
                  onTap: (() => Get.to(() => RecentOrderScreen())),
                  child: Text(
                    "View all",
                    style:
                        TextStyle(color: CustomColors.dark2, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.sp,
            ),
            ListView.separated(
              itemCount: controller.ordersList.length>4?4:controller.ordersList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
            ),
          ],
        );
      })),
    );
  }

  Widget item1({required String title, required String icon}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 6.sp),
          decoration: const BoxDecoration(
              color: CustomColors.blue, shape: BoxShape.circle),
          height: 26.sp,
          width: 26.sp,
          child: SvgPicture.asset(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 4.sp,
        ),
        Text(
          title,
          style: TextStyle(
              color: CustomColors.dark1,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp),
        ),
      ],
    );
  }

  Widget item2({required String title, required String icon}) {
    return Container(
        height: 102.sp,
        width: 102.sp,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
        decoration: BoxDecoration(
            color: CustomColors.liteBlue,
            borderRadius: BorderRadius.circular(20.sp)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 26.sp,
              width: 24.sp,
            ),
            SizedBox(
              height: 6.sp,
            ),
            Text(
              title,
              style: TextStyle(
                  color: CustomColors.dark1,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            ),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
