import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/api_error.dart';
import 'package:mahaly/data/Model/show_product_model.dart';
import 'package:mahaly/data/Source/remote/product/view.dart';
import 'package:mahaly/view/screen/Store/product/add_product_view.dart';

abstract class AbsProductController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ContShowProduct contShowProduct = ContShowProduct(Crud());
  List<ShowProductModel> products = [];
  gotoaddproductpage();
  getData();
}

class ProductController extends AbsProductController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  gotoaddproductpage() {
    Get.to(() => const AddProductView(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,
        ));
  }

  @override
  getData() async {
    products.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await contShowProduct.getData(Sharedpre.getString('store_id'));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List data = response['data'];
      products.addAll(data.map((e) => ShowProductModel.fromJson(e)));
    } else {
      ApiError apiError = response;
      Get.defaultDialog(
        title: 'Error',
        middleText: '${apiError.message}',
      );
    }
    update();
  }
}
