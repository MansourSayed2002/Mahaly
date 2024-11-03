import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Source/remote/profile/uploadimage.dart';
import 'package:mahaly/view/screen/Profile/edit_info_view.dart';
import 'package:mahaly/view/screen/Profile/info_profile.dart';
import 'package:mahaly/view/screen/Profile/setting_profile.dart';

abstract class AbsProfileController extends GetxController {
  File? file;
  ContUploadImage contUPloadFile = ContUploadImage(Crud());
  StatusRequest statusRequest = StatusRequest.none;
  gotosettingpage();
  gotoinfopage();
  gotoeditpage();
  opencamera();
  onpengallery();
  uploadimageProfile();
  logout();
}

class ProfileController extends AbsProfileController {
  @override
  gotoinfopage() {
    Get.to(
      () => const InfoProfileView(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  gotosettingpage() {
    Get.to(
      () => const SettingProfileView(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  gotoeditpage() {
    Get.to(
      () => const EditInfoView(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
  }

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
  Future opencamera() async {
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
    var response = await contUPloadFile.uploadimage(
        Sharedpre.getString('user_id'),
        file,
        Sharedpre.getString('user_image'));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      Sharedpre.setString('user_image', response['data']['users_image']);
      update();
    }
  }

  @override
  logout() {
    Sharedpre.myservices.sharedpre.clear();
  }
}
