import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/register/register.dart';
import 'package:mahaly/view/screen/Auth/SignUp_view.dart';
import 'package:mahaly/view/screen/Auth/veifycode_signup_view.dart';
import 'package:mahaly/view/screen/Forgetpassword/checkUsername_view.dart';
import 'package:mahaly/view/screen/Home/Homescreen_view.dart';

abstract class Abst_Register_Controller extends GetxController {
  late TextEditingController username;
  late TextEditingController password;
  bool showpassword = false;
  StatusRequest statusRequest = StatusRequest.none;
  late GlobalKey<FormState> formstate;
  Contregister contregister = Contregister(crud: Crud());
  gotosignup();
  gotoverifycode();
  gotoCheckUsername();
  gotohomepage();
  registeremail();
  changeshowpassword();
  addInfoInLocalStorage(response);
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
      addInfoInLocalStorage(response);
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
      () => const HomeScreenView(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  addInfoInLocalStorage(response) {
    Sharedpre.setString("step", "2");
    Sharedpre.setString("user_id", response['data']['users_id'].toString());
    Sharedpre.setString("user_name", response['data']['users_name']);
    Sharedpre.setString("user_username", response['data']['users_username']);
    Sharedpre.setString(
        "store_active", response['data']['users_active_store'].toString());
    Sharedpre.setString("user_phone", response['data']['users_phone']);
    Sharedpre.setString("user_egoogle", response['data']['users_egoogle']);
    Sharedpre.setString("user_image", response['data']['users_image']);
    Sharedpre.setString("user_date", response['data']['users_timestamp']);
    Sharedpre.setString("store_name", response['data']['store_name']);
    Sharedpre.setString(
        "store_description", response['data']['store_description']);
    Sharedpre.setString("store_image", response['data']['store_image']);
    Sharedpre.setString("store_id", response['data']['store_id']);
    Sharedpre.setString("store_active2", response['data']['store_active']);
    Sharedpre.setString("store_date",
        response['data']['store_timestamp'].toString().split(" ").first);
  }
}
