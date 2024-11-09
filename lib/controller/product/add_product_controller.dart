import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Source/remote/product/add.dart';

abstract class AbsAddProductController extends GetxController {
  List<File> images = [];
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController price;
  late GlobalKey<FormState> formstate;
  ContAddProduct contAddProduct = ContAddProduct(Crud());
  StatusRequest statusRequest = StatusRequest.none;
  opencamera();
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
  uploadproduct() async {
    statusRequest = StatusRequest.loading;
    var response = await contAddProduct.insertproduct(
        title.text,
        price.text,
        discount.text,
        count.text,
        description.text,
        Sharedpre.getString('store_id'),
        images);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Get.back();
      Get.snackbar("Done", "Pictures have been added");
    }
  }
}
