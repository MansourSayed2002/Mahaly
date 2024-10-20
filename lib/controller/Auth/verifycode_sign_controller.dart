import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/verify/verifycode.dart';
import 'package:mahaly/view/screen/congratulation/congratulation_view.dart';

abstract class AbsverifycodeSigncontroller extends GetxController {
  Contverify contverifyReset = Contverify(crud: Crud());
  late TextEditingController verifycode;
  late String username;
  StatusRequest statusRequest = StatusRequest.none;
  getinit();
  gotoCongratulationView();
  checkverifycode();
}

class VerifycodeSigncontroller extends AbsverifycodeSigncontroller {
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
  gotoCongratulationView() {
    Get.to(
      () => const CongratulationView(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  checkverifycode() async {
    var response = await contverifyReset.updateData(verifycode.text, username);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      gotoCongratulationView();
    } else {
      ApiError apiError = response;
      Get.defaultDialog(
        title: 'Error',
        middleText: '${apiError.message}',
      );
    }
  }
}
