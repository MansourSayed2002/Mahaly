import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/checkegoogle/checkegoogle.dart';
import 'package:mahaly/view/screen/Forgetpassword/users_view.dart';

abstract class AbsCheckUsernamecontroller extends GetxController {
  late TextEditingController egoogle;
  late GlobalKey<FormState> formstate;
  ConstCheckegoogle constCheckegoogle = ConstCheckegoogle(Crud());
  StatusRequest statusRequest = StatusRequest.none;
  checkegoogle();
  checkvalidate();
  gotousersview(data);
}

class CheckUsernamecontroller extends AbsCheckUsernamecontroller {
  @override
  void onInit() {
    egoogle = TextEditingController();
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    egoogle.dispose();
    super.dispose();
  }

  @override
  gotousersview(data) {
    Get.to(() => const UsersView(),
        transition: Transition.fade,
        arguments: {
          "data": data,
        },
        duration: const Duration(
          milliseconds: 500,
        ));
  }

  @override
  checkegoogle() async {
    var response = await constCheckegoogle.getusers(egoogle.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      gotousersview(response['data']);
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
      checkegoogle();
    } else {
      print('No validation');
    }
  }
}
