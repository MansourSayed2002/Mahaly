import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/register/register.dart';
import 'package:mahaly/view/screen/Auth/SignUp_view.dart';
import 'package:mahaly/view/screen/Forgetpassword/checkUsername_view.dart';
import 'package:mahaly/view/screen/Forgetpassword/verifycode_view.dart';

abstract class Abst_Register_Controller extends GetxController {
  late TextEditingController username;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<FormState> formstate;
  Contregister contregister = Contregister(crud: Crud());
  gotosignup();
  gotoverifycode();
  gotoCheckUsername();
  registeremail();
}

class Register_Controller extends Abst_Register_Controller {
  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  gotosignup() {
    Get.offAll(() => const Signup_view(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,
        ));
  }

  checkvalidate() {
    var form = formstate.currentState;
    if (form!.validate()) {
      registeremail();
    } else {
      print('No Validation');
    }
  }

  @override
  gotoCheckUsername() {
    Get.to(() => const CheckUsername_view(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,
        ));
  }

  @override
  registeremail() async {
    var response = await contregister.updateData(username.text, password.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print('succerss');
    } else {
      ApiError apiError = response;
      if (apiError.message == 'Please Approve Your Email') {
        gotoverifycode();
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: '${apiError.message}',
        );
      }
    }
  }

  @override
  gotoverifycode() {
    Get.to(() => const VerifyCode_view(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
        arguments: {
          "username": username.text,
        });
  }
}
