import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/onboarding/Onboarding_controller.dart';
import 'package:mahaly/data/Source/static/OnboardingData.dart';

class Custom_OnboardingExplane extends GetView<Onboarding_controller> {
  const Custom_OnboardingExplane({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15.0.r, right: 15.0.r, bottom: 10.0.r),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.6,
        child: PageView.builder(
          controller: controller.pagecontroller,
          onPageChanged: (val) {
            controller.changeindex(val);
          },
          scrollDirection: Axis.horizontal,
          itemCount: onboardingData.length,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 230.0.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("${onboardingData[index].image}"),
                  fit: BoxFit.fill,
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0.r, right: 15.0.r),
                child: Text(
                  "${onboardingData[index].body}".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0.sp),
                ),
              ),
            ],
          ),
        ));
  }
}
