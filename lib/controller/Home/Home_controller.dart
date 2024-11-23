import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/items_model.dart';
import 'package:mahaly/data/Source/remote/items/get_items.dart';

abstract class AbsHomecontroller extends GetxController {
  List<ItemsModel> items = [];
  late TextEditingController search;
  ContItems contItems = ContItems(Crud());
  StatusRequest statusRequest = StatusRequest.none;
  getItems();
}

class HomeController extends AbsHomecontroller {
  @override
  void onInit() {
    search = TextEditingController();
    getItems();
    super.onInit();
  }

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    var response = await contItems.getDataItems();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List data = response['items'];

      items.addAll(data.map((e) => ItemsModel.fromJson(e)));
    }
    update();
  }
}
