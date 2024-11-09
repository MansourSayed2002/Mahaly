import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/product/product_controller.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
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
      floatingActionButton: FloatingActionButton(
        onPressed: controller.gotoaddproductpage,
        child: Icon(
          Icons.add_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return GridView.builder(
        itemCount: controller.products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Container(),
      );
    });
  }
}
