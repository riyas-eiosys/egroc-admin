import 'package:e_groccer_admin/core/shared_preference/shared_preference.dart';
import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        if (SharedPreferenceRepo.instance.isLoggedIn == true) {
          Get.off(() => const MainScreen());
        } else {
          Get.off(() => LoginScreen());
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              IconAssets.appLogo,
              height: 200.sp,
              width: 200.sp,
            ),
          ),
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              IconAssets.eiosys,
              height: 45.sp,
              width: 100.sp,
            ),
          ),
          SizedBox(
            height: 20.sp,
          )
        ],
      ),
    );
  }
}
