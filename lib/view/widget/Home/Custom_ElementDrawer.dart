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
      child: Container(
        child: ListTileTheme(
          child: Column(
            children: [
              heightsizedBox(60.0.h),
              CircleAvatar(
                backgroundColor: ColorApp.fourth,
                radius: 70.0.r,
              ),
              Padding(
                padding: EdgeInsets.all(10.0.r),
                child: InkWell(
                  child: ListTile(
                    leading: Icon(
                      Icons.person_2_outlined,
                      size: 40.0.r,
                    ),
                    title: Text(
                      'Profile',
                      style: Textstyledynamic.white20Bold,
                    ),
                  ),
                ),
              ),
              const Customdivider(indent: 20.0),
              Padding(
                padding: EdgeInsets.all(10.0.r),
                child: InkWell(
                  onTap: () {
                    controller.gotoPageStore();
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.store_outlined,
                      size: 40.0.r,
                    ),
                    title: Text(
                      'Store',
                      style: Textstyledynamic.white20Bold,
                    ),
                  ),
                ),
              ),
              const Customdivider(indent: 20.0),
              Padding(
                padding: EdgeInsets.all(10.0.r),
                child: InkWell(
                  child: ListTile(
                    leading: Icon(
                      Icons.settings_outlined,
                      size: 40.0.r,
                    ),
                    title: Text(
                      'Setting',
                      style: Textstyledynamic.white20Bold,
                    ),
                  ),
                ),
              ),
              const Customdivider(indent: 20.0),
              Padding(
                padding: EdgeInsets.all(10.0.r),
                child: InkWell(
                  child: ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      size: 40.0.r,
                    ),
                    title: Text(
                      'Log Out',
                      style: Textstyledynamic.white20Bold,
                    ),
                  ),
                ),
              ),
              const Customdivider(indent: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
