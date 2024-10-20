import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/core/services/services.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/register/register.dart';
import 'package:mahaly/view/screen/Auth/SignUp_view.dart';
import 'package:mahaly/view/screen/Auth/veifycode_signup_view.dart';
import 'package:mahaly/view/screen/Forgetpassword/checkUsername_view.dart';
import 'package:mahaly/view/screen/Home/Home_view.dart';

abstract class Abst_Register_Controller extends GetxController {
  late TextEditingController username;
  late TextEditingController password;
  bool showpassword = false;
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<FormState> formstate;
  Contregister contregister = Contregister(crud: Crud());
  Myservices myservices = Get.find();
  gotosignup();
  gotoverifycode();
  gotoCheckUsername();
  gotohomepage();
  registeremail();
  changeshowpassword();
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
      myservices.sharedpre.setString("step", "2");
      Sharedpre.setString("user_id", response['data']['users_id'].toString());
      Sharedpre.setString("user_name", response['data']['users_name']);
      Sharedpre.setString("user_username", response['data']['users_username']);
      Sharedpre.setString(
          "store_active", response['data']['users_active_store'].toString());
      Sharedpre.setString("user_phone", response['data']['users_phone']);
      Sharedpre.setString("user_egoogle", response['data']['users_egoogle']);
      Sharedpre.setString("user_image", response['data']['users_image']);
      Sharedpre.setString("user_date", response['data']['users_timestamp']);

      gotohomepage();
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
    Get.to(() => const VerifyCodeSignupview(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
        arguments: {
          "username": username.text,
        });
  }

  @override
  changeshowpassword() {
    showpassword == false ? showpassword = true : showpassword = false;
    update();
  }

  @override
  gotohomepage() {
    Get.offAll(
      () => const Home_view(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }
}
