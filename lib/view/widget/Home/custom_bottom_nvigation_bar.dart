import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/homescreen_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenController>(
      builder: (controller) => Container(
        padding: EdgeInsets.all(4.0.r),
        decoration: const BoxDecoration(
            color: ColorApp.fifth,
            border: Border(
                top: BorderSide(
              color: ColorApp.primary,
            ))),
        width: MediaQuery.of(context).size.width,
        height: 60.0.h,
        child: Row(
          children: [
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(0);
              },
              iconData: Icons.home_outlined,
              text: '24'.tr,
              index: 0,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(1);
              },
              iconData: Icons.store_outlined,
              text: '25'.tr,
              index: 1,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(2);
              },
              iconData: Icons.chat_outlined,
              text: '28'.tr,
              index: 2,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(3);
              },
              iconData: Icons.person_2_outlined,
              text: '27'.tr,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class CustombottomItemBar extends GetView<HomescreenController> {
  const CustombottomItemBar({
    super.key,
    required this.iconData,
    required this.text,
    required this.index,
    required this.onTap,
  });
  final IconData iconData;
  final String text;
  final int index;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          height: 40.0.h,
          width: controller.currentindex == index ? 90.0.w : 10.0.w,
          alignment: Alignment.center,
          padding: EdgeInsets.all(5.0.r),
          decoration: BoxDecoration(
              color: controller.currentindex == index ? ColorApp.primary : null,
              borderRadius: BorderRadius.circular(20.0.r)),
          duration: const Duration(milliseconds: 300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).iconTheme.color,
              ),
              controller.currentindex == index
                  ? Text(
                      text,
                      style: Textstyledynamic.white16Blod
                          .copyWith(fontSize: 14.0.sp),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
