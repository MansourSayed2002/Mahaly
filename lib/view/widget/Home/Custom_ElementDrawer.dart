import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/view/widget/Home/custom_container_items_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/Drawer_controller.dart';

import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/view/widget/Home/Customdivider.dart';

class Custom_ElementDrawer extends StatelessWidget {
  const Custom_ElementDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Drawercontroller controller = Get.put(Drawercontroller());
    return SafeArea(
      child: ListTileTheme(
        child: Column(
          children: [
            heightsizedBox(60.0.h),
            Sharedpre.getString('user_image') != 'none'
                ? CircleAvatar(
                    radius: 80.0.r,
                    backgroundColor: ColorApp.fourth,
                    backgroundImage:
                        NetworkImage('${Sharedpre.getString('user_image')}'))
                : CircleAvatar(
                    radius: 80.0.r,
                    backgroundColor: ColorApp.fourth,
                    child: Icon(
                      Icons.person_2_outlined,
                      size: 150.0.r,
                    ),
                  ),
            CustomContaineritemDrawer(
              iconData: Icons.person_2_outlined,
              title: 'Profile',
              ontap: () {
                controller.gotoPageProfile();
              },
            ),
            Customdivider(indent: 20.0.w),
            CustomContaineritemDrawer(
              iconData: Icons.store_outlined,
              title: 'Store',
              ontap: () {
                controller.gotoPageStore();
              },
            ),
            Customdivider(indent: 20.0.w),
            CustomContaineritemDrawer(
              title: 'Setting',
              iconData: Icons.settings_outlined,
              ontap: () {},
            ),
            Customdivider(indent: 20.0.w),
            CustomContaineritemDrawer(
              title: 'Log Out',
              iconData: Icons.logout_outlined,
              ontap: () {
                Get.defaultDialog(
                  backgroundColor: ColorApp.primary,
                  title: 'Log Out',
                  titleStyle: Textstyledynamic.red30blod,
                  middleTextStyle: Textstyledynamic.white20Bold,
                  middleText: 'Are You Sure',
                  confirm: InkWell(
                    onTap: () {
                      controller.logout();
                    },
                    child: Container(
                      width: 100.0,
                      padding: EdgeInsets.all(10.0.r),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorApp.second,
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: Text(
                        'Ok',
                        style: Textstyledynamic.white16Blod,
                      ),
                    ),
                  ),
                  cancel: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 100.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0.r),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: Text(
                        'Cancel',
                        style: Textstyledynamic.white16Blod,
                      ),
                    ),
                  ),
                );
              },
            ),
            const Customdivider(indent: 20.0),
          ],
        ),
      ),
    );
  }
}
