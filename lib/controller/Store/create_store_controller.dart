import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Store/store_controller.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Source/remote/store/createstore.dart';

abstract class AbstCreateStoreController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ContCreateStore contCreateStore = ContCreateStore(Crud());
  late TextEditingController name;
  late TextEditingController description;
  createStore();
  addInfoInLocalStorage();
}

class CreateStoreController extends AbstCreateStoreController {
  @override
  void onInit() {
    name = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  createStore() async {
    StatusRequest statusRequest = StatusRequest.loading;
    var response = await contCreateStore.createStore(
        Sharedpre.getString('user_id'), "", name.text, description.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Sharedpre.setString('store_active', '1');
      addInfoInLocalStorage();
      Get.back();
      Get.put(StoreController()).update();
    }
  }

  @override
  addInfoInLocalStorage() {
    Sharedpre.setString('store_name', name.text);
    Sharedpre.setString('store_description', description.text);
    Sharedpre.setString('store_image', "");
    DateTime dateTime = DateTime.now();
    Sharedpre.setString("store_date", dateTime.toString().split(" ").first);
    Sharedpre.setString('first', '1');
  }
}
