import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/productofowner/products_of_admin_controller.dart';
import 'package:mahaly/core/class/status_request_view.dart';
import 'package:mahaly/core/constant/Links/Links.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/core/shared/custom_floating_button.dart';

class ProductOfAdminView extends StatelessWidget {
  const ProductOfAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductOfAdminController controller = Get.put(ProductOfAdminController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '36'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      floatingActionButton: CustomFloatingButtomGlobal(
        iconData: Icons.add_outlined,
        title: "31".tr,
        width: 130.0,
        ontap: controller.gotoaddproductpage,
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductOfAdminController>(builder: (controller) {
      return StatusRequestView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.products.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                controller.gotoDetailsProduct(controller.products[index]);
              },
              child: Container(
                margin: EdgeInsets.all(10.0.r),
                child: ListTile(
                  leading: SizedBox(
                    width: 110.0.w,
                    height: 110.0.h,
                    child: Image.network(
                      "${Applink.dirImageProduct}/${controller.products[index].image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "${controller.products[index].productTitle}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    "${controller.products[index].categoryName}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
