import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/screen/orders_screen/order_controller.dart';
import 'package:e_groccer_admin/shared_widget/appbar.dart';
import 'package:e_groccer_admin/shared_widget/button.dart';
import 'package:e_groccer_admin/shared_widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin<OrdersScreen> {
  int groupValue = 0;
  List<Map<String, dynamic>> items = [
    {"color": CustomColors.blue, "title": "Placed"},
    {"color": CustomColors.green, "title": "Delivered"},
    {"color": CustomColors.red, "title": "Cancelled"},
    {"color": CustomColors.orange, "title": "In Cart"},
  ];
  OrderController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustoms(
          title: "Orders",
          isSearch: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              backgroundColor: Colors.white,
              isScrollControlled: false,
              barrierColor: Colors.black.withOpacity(.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp))),
              builder: (BuildContext cont) {
                return Wrap(
                  children: [
                    modalSheet(),
                  ],
                );
              },
            );
          },
          child: Container(
            height: 48.sp,
            width: 48.sp,
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 8)
                ]),
            child: SvgPicture.asset(IconAssets.sort),
          ),
        ),
        body: GetBuilder<OrderController>(builder: (orderController) {
          return ListView(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 16.sp),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: const Color(0xFFD4D1D7))),
                        child: Text(
                          "Select date & time",
                          style: TextStyle(
                              color: CustomColors.dark2, fontSize: 12.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    CustomButton(
                      text: "Export",
                      onPressed: () {},
                      width: 87.sp,
                      child: SvgPicture.asset(
                        IconAssets.download,
                        color: Colors.white,
                        height: 14.sp,
                        width: 14.sp,
                      ),
                    )
                  ],
                ),
              ),
              ListView.separated(
                itemCount: controller.ordersList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.sp,
                ),
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
              SizedBox(
                height: 24.sp,
              )
            ],
          );
        }));
  }

  Widget modalSheet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 26.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              topRight: Radius.circular(20.sp))),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
                crossAxisSpacing: 16.sp,
                mainAxisSpacing: 16.sp),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return filterItem(
                  color: items[index]["color"], title: items[index]["title"]);
            },
          ),
          SizedBox(
            height: 24.sp,
          ),
          const Divider(
            color: CustomColors.dark3,
            thickness: 1,
          ),
          SizedBox(
            height: 16.sp,
          ),
          ListView.separated(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 16.sp,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return sortItem(
                  title: (index == 0) ? "ID Ascending" : "ID Descending",
                  value: index,
                  icon:
                      (index == 0) ? IconAssets.upArrow : IconAssets.downrrow);
            },
          ),
          SizedBox(
            height: 30.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                text: "Apply",
                onPressed: () {},
              ),
              SizedBox(
                width: 50.sp,
              ),
              InkWell(
                onTap: (() => Get.close(0)),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.16),
                              blurRadius: 6,
                              offset: Offset(0, 6.sp))
                        ]),
                    padding: EdgeInsets.all(2.sp),
                    child: Container(
                      padding: EdgeInsets.all(13.sp),
                      decoration: const BoxDecoration(
                        color: CustomColors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(IconAssets.close),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget sortItem(
      {required String title, required int value, required String icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (int? v) {
                groupValue = v ?? 0;
                print("change");
                setState(() {});
              },
              fillColor: MaterialStateProperty.all(CustomColors.blue),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SvgPicture.asset(
          icon,
          height: 12.sp,
          width: 6.sp,
        )
      ],
    );
  }

  Widget filterItem({required Color color, required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 9.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          border: Border.all(color: CustomColors.dark3)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            height: 20.sp,
            width: 20.sp,
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp),
          ),
          const Spacer()
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
