import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Resetpassword/users_controller.dart';
import 'package:mahaly/core/constant/Textstyle/Textstyle.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Customcontaineritems extends StatelessWidget {
  const Customcontaineritems({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.index,
  });

  final String title;
  final String subtitle;
  final void Function() onTap;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Userscontroller>(builder: (controller) {
      return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(15.0.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0.r),
            color: controller.indexlist == index
                ? ColorApp.second
                : ColorApp.fourth,
          ),
          child: ListTile(
            title: Text(
              title,
              style: Textstyledynamic.white20Bold,
            ),
            subtitle: Text(
              subtitle,
              style: Textstyledynamic.white16Blod,
            ),
          ),
        ),
      );
    });
  }
}
