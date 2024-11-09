import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/localization/localization.dart';

class Custom_changeLang extends GetView<MyLocalization> {
  const Custom_changeLang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyLocalization>(builder: (controllertran) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopupMenuButton(
            child: Container(
              margin: EdgeInsets.all(5.0.r),
              width: 120.0.w,
              height: 30.0.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0.r),
                  border: Border.all(color: ColorApp.primary, width: 2.0.w)),
              child: Row(
                children: [
                  Icon(
                    Icons.language_outlined,
                    color: ColorApp.primary,
                    size: 25.0.r,
                  ),
                  const Text('Language')
                ],
              ),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  '4'.tr,
                  style: TextStyle(fontSize: 18.0.sp),
                ),
                onTap: () {
                  controller.language = controller.changelang('ar');
                },
              ),
              PopupMenuItem(
                child: Text(
                  '5'.tr,
                  style: TextStyle(
                    fontSize: 18.0.sp,
                  ),
                ),
                onTap: () {
                  controller.language = controller.changelang('en');
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}
