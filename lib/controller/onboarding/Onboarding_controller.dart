import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/services/services.dart';
import 'package:mahaly/data/Source/static/OnboardingData.dart';
import 'package:mahaly/view/screen/Auth/SignUp_view.dart';

abstract class Abst_onboarding_controller extends GetxController {
  int currentndex = 0;

  PageController? pagecontroller;

  Myservices myservices = Get.find();

  changeindex(index);

  gotosignup();

  next();
}

class Onboarding_controller extends Abst_onboarding_controller {
  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }

  @override
  changeindex(index) {
    currentndex = index;
    update();
  }

  @override
  next() {
    currentndex++;
    if (currentndex > onboardingData.length - 1) {
      myservices.sharedpre.setString('step', "1");
      gotosignup();
    }
    pagecontroller!.animateToPage(currentndex,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  gotosignup() {
    myservices.sharedpre.setString('step', '1');
    Get.offAll(() => const Signup_view(),
        transition: Transition.leftToRightWithFade,
        duration: const Duration(
          milliseconds: 500,
        ));
  }
}
