import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/onboarding/Onboarding_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/view/widget/onboarding/Custom_animatedController.dart';
import 'package:mahaly/view/widget/onboarding/Custom_changeLang.dart';
import 'package:mahaly/view/widget/onboarding/Custom_onboardingExplane.dart';

class Onboarding_view extends StatelessWidget {
  const Onboarding_view({super.key});

  @override
  Widget build(BuildContext context) {
    Onboarding_controller controller = Get.put(Onboarding_controller());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 45.0.h),
        child: const Custom_changeLang(),
      ),
      backgroundColor: ColorApp.thierd,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Custom_OnboardingExplane(),
        const Custom_animatedController(),
        Custom_buttomPublic(
          title: "6".tr,
          color: ColorApp.sixth,
          colortext: ColorApp.thierd,
          ontap: () {
            controller.next();
          },
        ),
        Custom_buttomPublic(
          title: "7".tr,
          color: ColorApp.primary,
          colortext: ColorApp.thierd,
          ontap: () {
            controller.gotosignup();
          },
        ),
      ]),
    );
  }
}
