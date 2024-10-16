import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mahaly/controller/onboarding/Onboarding_controller.dart';
import 'package:mahaly/data/Source/static/OnboardingData.dart';

class Custom_animatedController extends StatelessWidget {
  const Custom_animatedController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onboarding_controller>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingData.length,
          (index) => AnimatedContainer(
            margin: EdgeInsets.all(4.0.r),
            width: controller.currentndex == index ? 20.0.w : 10.0.w,
            height: 10.h,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0.r),
              color: Colors.black,
            ),
          ),
        ),
      );
    });
  }
}
