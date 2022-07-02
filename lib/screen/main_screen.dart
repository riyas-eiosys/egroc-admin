import 'package:e_groccer_admin/core/utils/assets.dart';
import 'package:e_groccer_admin/core/utils/colors.dart';
import 'package:e_groccer_admin/screen/dashboard/dashboard_screen.dart';
import 'package:e_groccer_admin/screen/orders_screen/orders_screen.dart';
import 'package:e_groccer_admin/screen/product_manager_screen/product_manager_screen.dart';
import 'package:e_groccer_admin/shared_widget/nav_bar.dart';
import 'package:flutter/material.dart';
import '../core/utils/helper.dart' as helper;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  List<Widget> mainScreen = [
     DashBoardScreen(),
    const OrdersScreen(),
    ProductManagerScreen(),
    const Center(
      child: Text("Menu"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    helper.statusBarColor();
    return Scaffold(
      // backgroundColor: Colors.green,
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: IconAssets.dash, title: "Dashboard"),
          TabData(iconData: IconAssets.order, title: "Orders"),
          TabData(iconData: IconAssets.product, title: "Product Manager"),
          TabData(iconData: IconAssets.menu, title: "Menu")
        ],
        textColor: CustomColors.dark1,
        circleColor: CustomColors.blue,
        activeIconColor: Colors.white,
        inactiveIconColor: CustomColors.blue,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      body: mainScreen[currentPage],
    );
  }
}
