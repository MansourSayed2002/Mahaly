import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/profile/setting_profile.dart';
import 'package:mahaly/view/screen/Profile/change_password.dart';

abstract class AbsSettingProfileController extends GetxController {
  ContSettingProfile contSettingProfile = ContSettingProfile(Crud());
  late TextEditingController oldpassword;
  late TextEditingController newpassword;
  storestaus();
  changeStoreStatus();
  changePassword();
  gotochangepassword();
}

class SettingProfileController extends AbsSettingProfileController {
  @override
  void onInit() {
    oldpassword = TextEditingController();
    newpassword = TextEditingController();
    super.onInit();
  }

  @override
  storestaus() {
    return Sharedpre.getString('store_active') == "1" ? true : false;
  }

  @override
  changeStoreStatus() async {
    StatusRequest statusRequest = StatusRequest.loading;
    var response = await contSettingProfile.changeStutusOfStore(
        Sharedpre.getString('user_id'), Sharedpre.getString('store_active'));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (Sharedpre.getString('store_active') == "1") {
        Sharedpre.setString('store_active', '0');
      } else {
        Sharedpre.setString('store_active', '1');
      }
    }
    update();
  }

  @override
  changePassword() async {
    StatusRequest statusRequest = StatusRequest.loading;
    var response = await contSettingProfile.changePassword(
        Sharedpre.getString('user_id'), oldpassword.text, newpassword.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.back();
      Get.rawSnackbar(title: "Good", message: "The password has been changed");
    } else {
      ApiError apiError = response;
      Get.defaultDialog(
        title: 'Error',
        middleText: '${apiError.message}',
      );
    }
    update();
  }

  @override
  gotochangepassword() {
    Get.to(
      () => const ChangePasswordView(),
      duration: const Duration(milliseconds: 300),
      transition: Transition.rightToLeft,
    );
  }
}
