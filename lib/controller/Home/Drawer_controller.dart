import 'package:get/get.dart';
import 'package:mahaly/core/services/services.dart';
import 'package:mahaly/view/screen/Auth/SignUp_view.dart';
import 'package:mahaly/view/screen/Profile/profile_view.dart';
import 'package:mahaly/view/screen/Store/Storeview.dart';

abstract class AbsDrawerController extends GetxController {
  Myservices myservices = Get.find();
  gotoPageStore();
  gotoPageProfile();
  logout();
}

class Drawercontroller extends AbsDrawerController {
  @override
  gotoPageStore() {
    Get.to(
      () => const StoreView(),
      duration: const Duration(milliseconds: 300),
      transition: Transition.circularReveal,
    );
  }

  @override
  gotoPageProfile() {
    Get.to(
      () => const ProfileView(),
      duration: const Duration(milliseconds: 300),
      transition: Transition.circularReveal,
    );
  }

  @override
  logout() {
    myservices.sharedpre.setString('step', '1');
    myservices.sharedpre.remove('user_id');
    myservices.sharedpre.remove('user_name');
    myservices.sharedpre.remove('user_username');
    myservices.sharedpre.remove('store_active');
    myservices.sharedpre.remove('user_phone');
    myservices.sharedpre.remove('user_egoogle');
    myservices.sharedpre.remove('user_image');
    Get.offAll(
      () => const Signup_view(),
      duration: const Duration(milliseconds: 300),
      transition: Transition.upToDown,
    );
  }
}
