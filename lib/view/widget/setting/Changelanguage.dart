import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/view/widget/setting/dialog_change_lang.dart';

class Changelanguage extends StatelessWidget {
  const Changelanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '52'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: '53'.tr, content: const DialogChangeLang());
              },
              child: ListTile(
                title: Text(
                  "53".tr,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: Icon(
                  Icons.language,
                  color: ColorApp.fourth,
                  size: 30.0.r,
                ),
              )),
        ),
      ],
    );
  }
}
