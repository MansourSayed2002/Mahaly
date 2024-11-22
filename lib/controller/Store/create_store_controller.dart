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
  addInfoInLocalStorage(response);
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
      addInfoInLocalStorage(response['data']);
      Get.back();
      Get.put(StoreController()).update();
    }
  }

  @override
  addInfoInLocalStorage(response) {
    Sharedpre.setString('store_id', response['store_id']);
    Sharedpre.setString('store_name', response['store_name']);
    Sharedpre.setString('store_description', response['store_description']);
    Sharedpre.setString('store_image', response['store_image']);
    Sharedpre.setString(
        "store_date", response['store_timestamp'].toString().split(" ").first);
    Sharedpre.setString('first', '1');
  }
}
