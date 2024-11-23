import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/categores_model.dart';
import 'package:mahaly/data/Source/remote/categores/categores.dart';
import 'package:mahaly/view/screen/categores/add_categores.dart';

abstract class AbsCategoresController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ContCategores contCategores = ContCategores(Crud());
  List<CategoresModel> categores = [];
  getcat();
  gotoAddCat();
  deletecat(catid, index);
}

class CategoresController extends AbsCategoresController {
  @override
  void onInit() {
    getcat();
    super.onInit();
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
  gotoAddCat() {
    Get.to(
      () => const AddCategoresView(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  deletecat(catid, index) async {
    statusRequest = StatusRequest.loading;
    var response = await contCategores.deletecat(catid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      categores.removeAt(index);
    }
    update();
  }
}
