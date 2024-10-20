import 'package:get/get.dart';
import 'package:mahaly/view/screen/Forgetpassword/verifycode_view.dart';

abstract class AbsUserscontroller extends GetxController {
  List data = [];
  late String username;
  int? indexlist;
  dataInit();
  gotoverifycode();
  chooseusername(user, index);
}

class Userscontroller extends AbsUserscontroller {
  @override
  void onInit() {
    dataInit();
    super.onInit();
  }

  @override
  dataInit() {
    data = Get.arguments['data'];
  }

  @override
  gotoverifycode() {
    Get.to(() => const VerifyCodeview(),
        transition: Transition.fade,
        arguments: {
          "username": username,
        },
        duration: const Duration(
          milliseconds: 500,
        ));
  }

  @override
  chooseusername(user, index) {
    username = user;
    indexlist = index;
    update();
  }
}
