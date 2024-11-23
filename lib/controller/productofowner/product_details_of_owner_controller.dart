import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/show_product_model.dart';
import 'package:mahaly/data/Source/remote/product/productimage.dart';
import 'package:mahaly/data/Source/remote/product/removeimage.dart';

abstract class ABSProductDetailsOfOwnerController extends GetxController {
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController price;
  late GlobalKey<FormState> formstate;
  late ProductsOfAdminModel productsOfAdminModel;
  List<File> updateimage = [];
  List images = [];
  StatusRequest statusRequest = StatusRequest.loading;
  ContShowProductImage contshowproductimage = ContShowProductImage(Crud());
  ContRemoveProductImage contRemoveProductImage =
      ContRemoveProductImage(Crud());
  getdetails();
  onpengallery();
  checkvalidate();
  opencamera();
  removeimage(imageid, image);
}

class ProductDetailsOfOwnerController
    extends ABSProductDetailsOfOwnerController {
  @override
  void onInit() {
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      getdetails();
    });
    productsOfAdminModel = Get.arguments['product'];
    title = TextEditingController(text: productsOfAdminModel.productTitle);
    description =
        TextEditingController(text: productsOfAdminModel.productDescription);
    count = TextEditingController(
        text: productsOfAdminModel.productCount.toString());
    discount = TextEditingController(
        text: productsOfAdminModel.productDiscount.toString());
    price = TextEditingController(
        text: productsOfAdminModel.productPrice.toString());
    formstate = GlobalKey<FormState>();

    super.onInit();
  }

  @override
  getdetails() async {
    images.clear();
    var response =
        await contshowproductimage.getData(productsOfAdminModel.productId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      images.addAll(response['data']);
    }
    update();
  }

  @override
  checkvalidate() {
    var form = formstate.currentState;
    if (form!.validate()) {
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
      updateimage.add(file);
    }
    update();
  }

  @override
  opencamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      File file = File(photo.path);
      updateimage.add(file);
    }
    update();
  }

  @override
  removeimage(imageid, image) async {
    var response = await contRemoveProductImage.getData(imageid, image);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getdetails();
    }
    update();
  }
}
