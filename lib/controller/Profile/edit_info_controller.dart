import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/sharedpre.dart';

abstract class AbsEditInfoController extends GetxController {
  late TextEditingController name;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController egoogle;
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
}
