import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/screen/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarCustoms extends StatelessWidget with PreferredSizeWidget {
  const AppBarCustoms(
      {Key? key,
      required this.title,
      this.elevation = 1,
      this.isSearch = false})
      : super(key: key);
  final double elevation;
  final String title;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      iconTheme: const IconThemeData(color: CustomColors.dark1),
      title: Text(
        title,
        style: TextStyle(
            color: CustomColors.dark1,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        if (isSearch)
          IconButton(
              onPressed: () {
                Get.to(() => const SearchScreen());
              },
              icon: const Icon(Icons.search))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.sp);
}
