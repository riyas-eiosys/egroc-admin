import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/models/category_model/datum.dart';
import 'package:e_groccer_admin/screen/category_screen/add_or_edit_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      required this.category,
      required this.isLast,
      this.parentId,
      required this.isSubCategory})
      : super(key: key);
  final CategoryData category;
  final bool isLast;
  final bool isSubCategory;
  final int? parentId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 4.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: (isLast)
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(20.sp),
                  bottomRight: Radius.circular(20.sp))
              : BorderRadius.zero),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              category.id.toString(),
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Image.network(
              category.image.toString(),
              height: 44.sp,
              width: 44.sp,
              fit: BoxFit.fill,
              errorBuilder: (c, _, s) {
                return Image.asset(
                  ImageAssets.appLogo,
                  height: 44.sp,
                  width: 44.sp,
                  color: Colors.green,
                );
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  height: 4.sp,
                  width: 4.sp,
                  decoration: BoxDecoration(
                      color: (category.enabled == true)
                          ? CustomColors.green
                          : CustomColors.red,
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 4.sp,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    category.name.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Expanded(
            child: Text(
              category.priority.toString(),
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 22.sp,
                  width: 22.sp,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      color: CustomColors.red,
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: SvgPicture.asset(IconAssets.delete),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => AddEditCategoryScreen(
                          isEdit: true,
                          data: category,
                          isSubCategory: isSubCategory,
                          parentId: parentId,
                        ));
                  },
                  child: Container(
                    height: 22.sp,
                    width: 22.sp,
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        color: CustomColors.green,
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: SvgPicture.asset(IconAssets.edit),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
