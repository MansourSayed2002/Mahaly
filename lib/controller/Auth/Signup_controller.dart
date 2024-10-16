import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/signup/signup.dart';
import 'package:mahaly/view/screen/Auth/Register_view.dart';
import 'package:mahaly/view/screen/Forgetpassword/verifycode_view.dart';

abstract class Abst_Signup_controller extends GetxController {
  late TextEditingController name;
  late TextEditingController username;
  late TextEditingController egoogle;
  late TextEditingController phone;
  late TextEditingController password;
  late GlobalKey<FormState> formstate;
  gotoregister();
  createemail();
  checkvalidate();
}

class Signup_controller extends Abst_Signup_controller {
  Contsignup contsignup = Contsignup(crud: Crud());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    name = TextEditingController();
    username = TextEditingController();
    egoogle = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  gotoregister() {
    Get.offAll(() => const Register_view(),
        transition: Transition.fade,
        duration: const Duration(
          microseconds: 500,
        ));
  }

  @override
  createemail() async {
    var response = await contsignup.updateData(
        name.text, username.text, egoogle.text, phone.text, password.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.to(() => const VerifyCode_view(),
          duration: const Duration(milliseconds: 300),
          transition: Transition.fade,
          arguments: {
            "username": username.text,
          });
    } else {
      ApiError apiError = response;
      Get.defaultDialog(
        title: 'Error',
        middleText: '${apiError.message}',
      );
    }
  }

  @override
  checkvalidate() {
    var form = formstate.currentState;
    if (form!.validate()) {
      createemail();
    } else {
      print('No Validation');
    }
  }
}
