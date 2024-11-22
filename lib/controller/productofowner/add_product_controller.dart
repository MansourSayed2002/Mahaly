import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/categores_model.dart';
import 'package:mahaly/data/Source/remote/categores/categores.dart';
import 'package:mahaly/data/Source/remote/product/add.dart';

abstract class AbsAddProductController extends GetxController {
  List<File> images = [];
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController price;
  late GlobalKey<FormState> formstate;
  int cat = 0;
  List<CategoresModel> categores = [];
  ContAddProduct contAddProduct = ContAddProduct(Crud());
  ContCategores contCategores = ContCategores(Crud());
  StatusRequest statusRequest = StatusRequest.none;
  opencamera();
  getcat();
  onpengallery();
  uploadproduct();
}

class AddProductController extends AbsAddProductController {
  @override
  void onInit() {
    title = TextEditingController();
    description = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();
    formstate = GlobalKey<FormState>();
    getcat();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    count.dispose();
    discount.dispose();
    price.dispose();
    super.dispose();
  }

  checkvalidate() {
    var form = formstate.currentState;
    if (form!.validate()) {
      uploadproduct();
    } else {
      print('No Validation');
    }
  }

  @override
  onpengallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      File file = File(photo.path);
      images.add(file);
    }
    update();
  }

  @override
  opencamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      File file = File(photo.path);
      images.add(file);
    }
    update();
  }

  @override
  getcat() async {
    categores.clear();
    statusRequest = StatusRequest.loading;
    var response = await contCategores.getcat(Sharedpre.getString('user_id'));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List data = response['data'];
      categores.addAll(data.map((e) => CategoresModel.fromJson(e)));
    }
    update();
  }

  @override
  uploadproduct() async {
    statusRequest = StatusRequest.loading;
    if (images.isNotEmpty && cat != 0) {
      var response = await contAddProduct.insertproduct(
          title.text,
          price.text,
          discount.text,
          count.text,
          description.text,
          Sharedpre.getString('store_id'),
          cat,
          images);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        Get.back();
        Get.snackbar(
          "Done",
          "Product have been added",
          colorText: Colors.black,
        );
      }
    }
  }
}
