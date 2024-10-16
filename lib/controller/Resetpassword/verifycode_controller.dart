import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Source/remote/verify/verifycode.dart';
import 'package:mahaly/view/screen/Forgetpassword/Resetpassword_view.dart';
import 'package:mahaly/view/screen/congratulation/congratulation_view.dart';

abstract class Abs_verifycode_controller extends GetxController {
  Contverify contverify = Contverify(crud: Crud());
  late TextEditingController verifycode;
  late String username;
  StatusRequest statusRequest = StatusRequest.none;
  getinit();
  gotoRessetpassword();
  checkverifycode();
}

class Verifycode_controller extends Abs_verifycode_controller {
  @override
  void onInit() {
    getinit();
    verifycode = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    verifycode.dispose();
    super.dispose();
  }

  @override
  getinit() {
    username = Get.arguments['username'];
  }

  @override
  gotoRessetpassword() {
    Get.to(() => const Resetpassword_view(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,
        ));
  }

  @override
  checkverifycode() async {
    var response = await contverify.updateData(verifycode.text, username);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.to(
        () => const CongratulationView(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
}
