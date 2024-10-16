import 'package:get/get.dart';
import 'package:mahaly/view/screen/Store/Storeview.dart';

class Drawercontroller extends GetxController {
  gotoPageStore() {
    Get.to(
      () => const StoreView(),
      transition: Transition.circularReveal,
    );
  }
}
