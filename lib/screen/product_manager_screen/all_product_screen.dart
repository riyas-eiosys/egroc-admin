import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/models/products_model/products_model.dart';
import 'package:e_groccer_admin/screen/product_manager_screen/all_product_controller.dart';
import 'package:e_groccer_admin/shared_widget/appbar.dart';
import 'package:e_groccer_admin/shared_widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getAllProducts();
    });
    // TODO: implement initState
    super.initState();
  }

  int groupValue = 0;

  List<Map<String, dynamic>> items = [
    {"color": CustomColors.blue, "title": "Placed"},
    {"color": CustomColors.green, "title": "Delivered"},
    {"color": CustomColors.red, "title": "Cancelled"},
    {"color": CustomColors.orange, "title": "In Cart"},
  ];
  final controller = Get.put(AllProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustoms(
          title: "Products",
          isSearch: true,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.3), blurRadius: 5)
          ]),
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "Import",
                width: 108.sp,
                onPressed: () {},
                child: SvgPicture.asset(
                  IconAssets.upload,
                  height: 16.sp,
                  width: 16.sp,
                ),
              ),
              CustomButton(
                text: "Export",
                width: 108.sp,
                onPressed: () {},
                child: SvgPicture.asset(
                  IconAssets.download,
                  height: 14.sp,
                  width: 14.sp,
                ),
              ),
              CustomButton(
                text: "Add",
                width: 108.sp,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  size: 14.sp,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: InkWell(
          onTap: () {},
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
        body: GetBuilder<AllProductController>(
          builder: (productController) => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 24.sp),
            itemCount: productController.products.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 12.sp,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (() {}),
                child: ProductItem(
                  product: productController.products[index],
                  index: index + 1,
                ),
              );
            },
          ),
        ));
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.product, required this.index})
      : super(key: key);
  final ProductModel product;
  AllProductController controller = Get.find();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(
              color: (product.enabled == true)
                  ? CustomColors.dark3
                  : CustomColors.red)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(11.sp),
            child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64.sp,
                    width: 64.sp,
                    child: Image.network(
                      (product.productsImage?.isEmpty == true)
                          ? ""
                          : product.productsImage?.first.image ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 12.sp,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Id: ${product.id}",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
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
                                _buildPopupMenuItem('Edit', 1, IconAssets.edit),
                                _buildPopupMenuItem(
                                    (product.enabled == true)
                                        ? "Disable Product"
                                        : 'Enable Product',
                                    2,
                                    IconAssets.disabled),
                              ],
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
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
                        Text(product.name.toString(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.dark1)),
                        SizedBox(
                          height: 8.sp,
                        ),
                        Row(
                          children: [
                            Text("No of Orders: $index",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: CustomColors.dark1)),
                            SizedBox(
                              width: 8.sp,
                            ),
                            Text("Sales: ₹",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.dark1)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          const Divider(
            color: CustomColors.dark3,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 22.sp, right: 22.sp, top: 12.sp, bottom: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Clicks :956",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.dark2)),
                Container(
                  height: 4.sp,
                  width: 4.sp,
                  decoration: const BoxDecoration(
                      color: CustomColors.dark2, shape: BoxShape.circle),
                ),
                Text("Impressions: 33710",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.dark2)),
                Container(
                  height: 4.sp,
                  width: 4.sp,
                  decoration: const BoxDecoration(
                      color: CustomColors.dark2, shape: BoxShape.circle),
                ),
                Text("CTR: 2.80%",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.dark2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position, String icon) {
    return PopupMenuItem(
      value: position,
      height: 25.sp,
      child: InkWell(
        onTap: () {
          controller.enableProduct(
              data: {"enabled": (product.enabled == true) ? false : true},
              id: product.id!);
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
