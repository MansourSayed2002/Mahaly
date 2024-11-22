import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Source/remote/categores/categores.dart';

abstract class AbsAddCategoresCotroller extends GetxController {
  late TextEditingController namecat;
  late GlobalKey<FormState> formsate;
  ContCategores contCategores = ContCategores(Crud());
  StatusRequest statusRequest = StatusRequest.none;

  addCat();
  checkvalidate();
}

class AddCategoresController extends AbsAddCategoresCotroller {
  @override
  void onInit() {
    namecat = TextEditingController();
    formsate = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    namecat.dispose();
    super.dispose();
  }

  @override
  addCat() async {
    statusRequest = StatusRequest.loading;
    var response = await contCategores.addcat(
        Sharedpre.getString('user_id'), namecat.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.back();
    }
  }

  @override
  checkvalidate() {
    var form = formsate.currentState;
    if (form!.validate()) {
      addCat();
    } else {
      print("Validation");
    }
  }
}
