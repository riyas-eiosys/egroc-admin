import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/screen/category_screen/all_category_screen.dart';
import 'package:e_groccer_admin/screen/product_manager_screen/all_product_screen.dart';
import 'package:e_groccer_admin/shared_widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductManagerScreen extends StatelessWidget {
  ProductManagerScreen({Key? key}) : super(key: key);
  List<Widget> icons = [
    SvgPicture.asset(
      IconAssets.product,
      color: Colors.white,
      height: 46.sp,
      width: 46.sp,
    ),
    SvgPicture.asset(
      IconAssets.category,
      color: Colors.white,
      height: 42.sp,
      width: 42.sp,
    ),
    SvgPicture.asset(
      IconAssets.attributes,
      color: Colors.white,
      height: 30.sp,
      width: 40.sp,
    ),
    SvgPicture.asset(
      IconAssets.label,
      color: Colors.white,
      height: 47.sp,
      width: 37.sp,
    ),
  ];
  List<VoidCallback> onTap = [
    () {
      Get.to(() => const AllProductScreen());
    },
    () {
      Get.to(() => AllCategoryScreen());
    },
    () {},
    () {}
  ];
  List<String> title = ["Products", "Category", "Attributes", "Brand"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustoms(
        title: "Product Management",
      ),
      body: GridView.builder(
        itemCount: title.length,
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 24.sp),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15.sp, crossAxisSpacing: 15.sp),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: onTap[index],
            child: Item1(
              icon: icons[index],
              title: title[index],
            ),
          );
        },
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key, required this.icon, required this.title})
      : super(key: key);
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.sp),
      decoration: BoxDecoration(
          color: CustomColors.blue, borderRadius: BorderRadius.circular(20.sp)),
      child: Column(children: [
        const Spacer(),
        icon,
        const Spacer(),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.white),
        )
      ]),
    );
  }
}
