import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/Home_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/view/widget/Home/Custom_AppBarHome.dart';
import 'package:mahaly/view/widget/Home/Custom_ElementDrawer.dart';

class Home_view extends StatelessWidget {
  const Home_view({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return AdvancedDrawer(
        controller: controller.advancedDrawerController,
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorApp.primary,
                ColorApp.second,
              ],
            ),
          ),
        ),
        drawer: const Custom_ElementDrawer(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 100.0.h),
            child: const Custom_AppBarHome(),
          ),
        ));
  }
}
