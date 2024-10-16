import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/Home_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Custom_AppBarHome extends GetView<HomeController> {
  const Custom_AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    controller.advancedDrawerController.showDrawer();
                  },
                  icon: ValueListenableBuilder(
                      valueListenable: controller.advancedDrawerController,
                      builder: (context, value, child) => AnimatedSwitcher(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            child: Icon(
                              value.visible ? Icons.clear : Icons.menu,
                              key: ValueKey<bool>(value.visible),
                              size: 30.0.r,
                            ),
                          ))),
              Container(
                margin: EdgeInsets.all(10.0.r),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      'M',
                      style: TextStyle(
                        fontSize: 35.0.sp,
                        color: ColorApp.primary,
                      ),
                    ),
                    Positioned(
                      left: 20.0.w,
                      top: 5.0.h,
                      child: Text(
                        'y',
                        style: TextStyle(
                          fontSize: 35.0.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.second,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
