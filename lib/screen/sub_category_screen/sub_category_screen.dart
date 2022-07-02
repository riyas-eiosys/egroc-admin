import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/models/category_model/datum.dart';
import 'package:e_groccer_admin/screen/category_screen/add_or_edit_category_screen.dart';
import 'package:e_groccer_admin/screen/category_screen/all_category_controller.dart';
import 'package:e_groccer_admin/shared_widget/appbar.dart';
import 'package:e_groccer_admin/shared_widget/button.dart';
import 'package:e_groccer_admin/shared_widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key, required this.data}) : super(key: key);

  final CategoryData data;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  CategoryController controller = Get.put(CategoryController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSubCategory(id: widget.data.id.toString());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustoms(
          title: widget.data.name.toString(),
          isSearch: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20.sp),
          child: CustomButton(
            text: "Add",
            child: Text(
              "+",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Get.to(() => AddEditCategoryScreen(
                    isSubCategory: true,
                    parentId: widget.data.id!,
                  ));
            },
          ),
        ),
        body: GetBuilder<CategoryController>(builder: (categoryController) {
          return (categoryController.subCategories.isEmpty)
              ? const Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              : ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 16.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: CustomColors.dark3, width: 1.sp),
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.sp, vertical: 22.sp),
                            decoration: BoxDecoration(
                                color: CustomColors.dark3,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.sp),
                                    topRight: Radius.circular(20.sp))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "ID",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      "Icon",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Center(
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Priority",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Center(
                                    child: Text(
                                      "Action",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // padding: EdgeInsets.symmetric(
                            // horizontal: 16.sp, vertical: 24.sp),
                            itemCount: categoryController.subCategories.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                color: CustomColors.dark3,
                                thickness: 1.sp,
                                height: 2.sp,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryItem(
                                category:
                                    categoryController.subCategories[index],
                                isLast:
                                    (categoryController.subCategories.length -
                                            1) ==
                                        index,
                                isSubCategory: true,
                                parentId: widget.data.id!,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80.sp,
                    )
                  ],
                );
        }));
  }
}
