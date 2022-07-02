import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/screen/login_screen/login_controller.dart';
import 'package:e_groccer_admin/shared_widget/button.dart';
import 'package:e_groccer_admin/shared_widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<LoginController>(
            builder: (loginController) => Form(
              key: _formKey,
              child: ListView(
                padding:
                    EdgeInsets.symmetric(vertical: 24.sp, horizontal: 16.sp),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12.sp,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      IconAssets.appLogo,
                      color: CustomColors.blue.withOpacity(.8),
                    ),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  Text(
                    "Admin Login",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.blue),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  Text(
                    "Email ID",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  TextFormFieldCustom(
                    controller: emailController,
                    validator: (value) {
                      Pattern pattern =
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$";
                      RegExp regex = RegExp(pattern.toString());
                      if (!regex.hasMatch(value!) ||
                          // ignore: unnecessary_null_comparison
                          value == null) {
                        return 'Enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    hint: "Email Address",
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  TextFormFieldCustom(
                    controller: paasswordController,
                    hint: "Password",
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 50.sp,
                  ),
                  Center(
                    child: CustomButton(
                      text: "Login",
                      width: 250.sp,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          loginController.login(
                              email: emailController.text,
                              password: paasswordController.text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

