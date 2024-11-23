import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/homescreen_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(0);
              },
              iconData: Icons.home,
              iconDataoutlind: Icons.home_outlined,
              index: 0,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(1);
              },
              iconData: Icons.store,
              iconDataoutlind: Icons.store_outlined,
              index: 1,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(2);
              },
              iconData: Icons.favorite,
              iconDataoutlind: Icons.favorite_border_outlined,
              index: 2,
            ),
            CustombottomItemBar(
              onTap: () {
                controller.changeindex(3);
              },
              iconData: Icons.chat,
              iconDataoutlind: Icons.chat_outlined,
              index: 3,
            ),
            CustombottomItemBar(
                onTap: () {
                  controller.changeindex(4);
                },
                iconData: Icons.person_2,
                iconDataoutlind: Icons.person_2_outlined,
                index: 4),
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
    required this.iconDataoutlind,
    required this.index,
    required this.onTap,
  });
  final IconData iconDataoutlind;
  final IconData iconData;
  final int index;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        controller.currentindex == index ? iconData : iconDataoutlind,
        color: Theme.of(context).iconTheme.color,
        size: 26.0.r,
      ),
    );
  }
}
