import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Source/remote/profile/editinfo.dart';

abstract class AbsEditInfoController extends GetxController {
  ContUpdateInfo contUpdateInfo = ContUpdateInfo(Crud());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController egoogle;

  updateInfoProfile();
}

class EditInfoController extends AbsEditInfoController {
  @override
  void onInit() {
    name = TextEditingController(text: Sharedpre.getString('user_name'));
    username =
        TextEditingController(text: Sharedpre.getString('user_username'));
    phone = TextEditingController(text: Sharedpre.getString('user_phone'));
    egoogle = TextEditingController(text: Sharedpre.getString('user_egoogle'));
    super.onInit();
  }

  @override
  updateInfoProfile() async {
    statusRequest = StatusRequest.loading;
    var response = await contUpdateInfo.updateinfo(
        Sharedpre.getString('user_id'),
        name.text,
        username.text,
        phone.text,
        egoogle.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Sharedpre.setString("user_name", name.text);
      Sharedpre.setString("user_username", username.text);
      Sharedpre.setString("user_phone", phone.text);
      Sharedpre.setString("user_egoogle", egoogle.text);
      Get.back();
      Get.rawSnackbar(
          title: "Good", message: "The information has been changed");
    } else {
      ApiError apiError = response;
      Get.defaultDialog(
        title: 'Error',
        middleText: '${apiError.message}',
      );
    }
  }
}
