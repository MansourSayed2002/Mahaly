import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/design_theme.dart';

class Changetheme extends StatelessWidget {
  const Changetheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '55'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: InkWell(
              onTap: () {
                DesignTheme.changetheme('dark');
              },
              child: ListTile(
                title: Text(
                  "54".tr,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: Icon(
                  Icons.dark_mode_outlined,
                  color: ColorApp.fourth,
                  size: 30.0.r,
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: InkWell(
              onTap: () {
                DesignTheme.changetheme('dight');
              },
              child: ListTile(
                title: Text(
                  "56".tr,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: Icon(
                  Icons.light_mode_outlined,
                  color: ColorApp.fourth,
                  size: 30.0.r,
                ),
              )),
        ),
      ],
    );
  }
}
