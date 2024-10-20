import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/resetpassword/resetpassword.dart';
import 'package:mahaly/view/screen/congratulation/congratulation_view.dart';

abstract class Abs_Ressetpassword_controler extends GetxController {
  late TextEditingController newpassword;
  late TextEditingController resetnewpassword;
  StatusRequest statusRequest = StatusRequest.none;
  ContResetpassword contResetpassword = ContResetpassword(Crud());
  late String username;
  initdata();
  changepassword();
  gotocongrate();
}

class Ressetpassword_Controller extends Abs_Ressetpassword_controler {
  @override
  void onInit() {
    initdata();
    newpassword = TextEditingController();
    resetnewpassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();
    resetnewpassword.dispose();
    super.dispose();
  }

  @override
  changepassword() async {
    if (newpassword.text == resetnewpassword.text) {
      var response =
          await contResetpassword.changepassword(username, newpassword.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        gotocongrate();
      } else {
        ApiError apiError = response;
        Get.defaultDialog(
          title: 'Error',
          middleText: '${apiError.message}',
        );
      }
    } else {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Check Your new password',
      );
    }
  }

  @override
  gotocongrate() {
    Get.to(
      () => const CongratulationView(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  initdata() {
    username = Get.arguments['username'];
  }
}
