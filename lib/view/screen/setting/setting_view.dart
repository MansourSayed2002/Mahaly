import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Profile/setting_profile.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/view/widget/setting/Changelanguage.dart';
import 'package:mahaly/view/widget/setting/changetheme.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingProfileController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<SettingProfileController> {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              "15".tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              '19'.tr,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing:
                GetBuilder<SettingProfileController>(builder: (controller) {
              return Switch(
                value: controller.storestaus(),
                onChanged: (val) {
                  controller.changeStoreStatus();
                },
                activeColor: Theme.of(context).iconTheme.color,
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.all(10.0.r),
            child: InkWell(
                onTap: () {
                  controller.gotochangepassword();
                },
                child: ListTile(
                  title: Text(
                    "20".tr,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: Icon(
                    Icons.key_outlined,
                    color: ColorApp.fourth,
                    size: 30.0.r,
                  ),
                )),
          ),
          const Changelanguage(),
          const Changetheme(),
        ],
      ),
    );
  }
}
