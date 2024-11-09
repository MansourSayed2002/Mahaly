import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Source/remote/store/store.dart';
import 'package:mahaly/view/screen/Store/create_store.dart';
import 'package:mahaly/view/screen/Store/information/information_view.dart';
import 'package:mahaly/view/screen/Store/product/product_view.dart';

abstract class AbstStoreController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ContStore contStore = ContStore(Crud());
  changeStoreStatus();
  gotoStoreInfoPage();
  goToCreateStorePage();
  gotoProductview();
}

class StoreController extends AbstStoreController {
  @override
  changeStoreStatus() async {
    StatusRequest statusRequest = StatusRequest.loading;
    var response = await contStore.changeStutusOfStore(
        Sharedpre.getString('user_id'), Sharedpre.getString('store_active'));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (Sharedpre.getString('store_active') == "1") {
        Sharedpre.setString('store_active', '0');
      } else {
        Sharedpre.setString('store_active', '1');
      }
    }
    update();
  }

  @override
  gotoStoreInfoPage() {
    Get.to(
      () => const InformationView(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  goToCreateStorePage() {
    if (Sharedpre.getString('first') != null ||
        Sharedpre.getString('store_id') != "null") {
      changeStoreStatus();
    } else {
      Get.to(
        () => const CreateStore(),
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 300),
      );
    }
    update();
  }

  @override
  gotoProductview() {
    Get.to(
      () => const ProductView(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
  }
}
