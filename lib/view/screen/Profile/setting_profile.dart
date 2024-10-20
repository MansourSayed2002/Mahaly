import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/Textstyle/Textstyle.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';

class SettingProfileView extends StatelessWidget {
  const SettingProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorApp.primary,
        leading: const Buttonappbarback(),
      ),
      backgroundColor: ColorApp.primary,
      body: const CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            "15".tr,
            style: Textstyledynamic.white20Bold,
          ),
          subtitle: Text(
            '19'.tr,
            style: Textstyledynamic.white16Blod,
          ),
          trailing: Switch(
            value: true,
            onChanged: (val) {},
            activeColor: ColorApp.sixth,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  "20".tr,
                  style: Textstyledynamic.white20Bold,
                ),
                trailing: Icon(
                  Icons.key_outlined,
                  color: ColorApp.fourth,
                  size: 30.0.r,
                ),
              )),
        ),
      ],
    );
  }
}
