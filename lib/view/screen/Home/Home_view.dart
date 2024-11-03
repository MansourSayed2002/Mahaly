import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/Home_controller.dart';
import 'package:mahaly/view/widget/Home/Custom_AppBarHome.dart';

class Home_view extends StatelessWidget {
  const Home_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 290.0.h),
        child: const Custom_AppBarHome(),
      ),
    );
  }
}
