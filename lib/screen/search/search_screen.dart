import 'package:e_groccer_admin/shared_widget/appbar.dart';
import 'package:e_groccer_admin/shared_widget/button.dart';
import 'package:e_groccer_admin/shared_widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController orderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustoms(title: "Search"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 22.sp),
        children: [
          TextFormFieldCustom(
              controller: orderController, hint: "Order Reference"),
          SizedBox(
            height: 16.sp,
          ),
          TextFormFieldCustom(controller: nameController, hint: "User Name "),
          SizedBox(
            height: 16.sp,
          ),
          TextFormFieldCustom(
              controller: mobileController, hint: "Mobile Number"),
          SizedBox(
            height: 16.sp,
          ),
          TextFormFieldCustom(
              controller: emailController, hint: "Email Address"),
          SizedBox(
            height: 22.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "Search",
                onPressed: () {},
                width: 130.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
