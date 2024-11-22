import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Source/remote/store/editimage.dart';

abstract class ABSInformationController extends GetxController {
  File? file;
  ContEditImageStore contEditImageStore = ContEditImageStore(Crud());
  StatusRequest statusRequest = StatusRequest.none;
  onpengallery();
  opencamera();
  uploadimageProfile();
}

class InformationController extends ABSInformationController {
  @override
  onpengallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      file = File(photo.path);
      uploadimageProfile();
    }
  }

  @override
  opencamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      file = File(photo.path);
      uploadimageProfile();
    }
  }

  @override
  uploadimageProfile() async {
    statusRequest = StatusRequest.loading;
    var response = await contEditImageStore.uploadimage(
        Sharedpre.getString('store_id'),
        file,
        Sharedpre.getString('store_image'));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Sharedpre.setString('store_image', response['data']['store_image']);
    }
    update();
  }
}
