import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/productofowner/product_details_of_owner_controller.dart';
import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/core/shared/text_form_global.dart';
import 'package:mahaly/view/widget/Store/product_details/custom_dicount_and_count.dart';
import 'package:mahaly/view/widget/Store/product_details/custom_price_and_categores.dart';
import 'package:mahaly/view/widget/Store/product_details/product_images_details.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsOfOwnerController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Edit Product',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.save_alt_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<ProductDetailsOfOwnerController> {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formstate,
      child: ListView(
        children: [
          const ShowProductImage(),
          TextFormGlobal(
            cursorColor: Colors.black,
            label: '32'.tr,
            obscureText: false,
            filled: true,
            controllerForm: controller.title,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).iconTheme.color,
            textcolor: Theme.of(context).hintColor,
            labelcolor: Theme.of(context).iconTheme.color,
            validator: (val) {
              return textformvalidation(7, 100, 'none', val!);
            },
          ),
          TextFormGlobal(
            cursorColor: Colors.black,
            obscureText: false,
            label: "29".tr,
            maxLines: 3,
            controllerForm: controller.description,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            labelcolor: Theme.of(context).iconTheme.color,
            textcolor: Theme.of(context).hintColor,
            contentpanding: EdgeInsets.all(30.0.r),
            borderColor: Theme.of(context).iconTheme.color,
            validator: (val) {
              return textformvalidation(20, 1000, 'none', val!);
            },
          ),
          const CustomDiscountandCountDetails(),
          const CustomPriceAndCategoresDetails(),
        ],
      ),
    );
  }
}
