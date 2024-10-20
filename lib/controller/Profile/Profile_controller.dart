import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahaly/view/screen/Profile/edit_info_view.dart';
import 'package:mahaly/view/screen/Profile/info_profile.dart';
import 'package:mahaly/view/screen/Profile/setting_profile.dart';

abstract class AbsProfileController extends GetxController {
  File? file;
  gotosettingpage();
  gotoinfopage();
  gotoeditpage();
  opencamera();
  onpengallery();
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
    }
  }

  @override
  Future opencamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      file = File(photo.path);
    }
  }
}
