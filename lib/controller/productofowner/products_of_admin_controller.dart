import 'dart:async';
import 'package:get/get.dart';
import 'package:mahaly/core/class/Crud/Crud.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/function/handlingData.dart';
import 'package:mahaly/data/Model/show_product_model.dart';
import 'package:mahaly/data/Source/remote/product/view.dart';
import 'package:mahaly/view/screen/Store/product/add_product_view.dart';
import 'package:mahaly/view/screen/Store/product/product_details.dart';

abstract class AbsProductOfAdminController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  ContShowProduct contShowProduct = ContShowProduct(Crud());
  List<ProductsOfAdminModel> products = [];
  gotoaddproductpage();
  getData();
  gotoDetailsProduct(product);
}

class ProductOfAdminController extends AbsProductOfAdminController {
  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getData();
    });
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
    // statusRequest = StatusRequest.loading;
    var response =
        await contShowProduct.getData(Sharedpre.getString('store_id'));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List data = response['data'];
      products.addAll(data.map((e) => ProductsOfAdminModel.fromJson(e)));
    }
    update();
  }

  @override
  gotoDetailsProduct(product) {
    Get.to(() => const ProductDetails(),
        transition: Transition.fade,
        arguments: {
          "product": product,
        },
        duration: const Duration(
          milliseconds: 500,
        ));
  }
}
