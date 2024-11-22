import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/productofowner/add_product_controller.dart';

import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/core/shared/custom_floating_button.dart';
import 'package:mahaly/view/widget/Store/product/custom_add_product_images.dart';
import 'package:mahaly/view/widget/Store/product/custom_discount_and_count.dart';
import 'package:mahaly/view/widget/Store/product/custom_price_and_categores.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductController controller = Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '31'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      floatingActionButton: CustomFloatingButtomGlobal(
        iconData: Icons.save_alt_outlined,
        title: "57".tr,
        width: 130.0,
        ontap: controller.uploadproduct,
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<AddProductController> {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formstate,
      child: ListView(
        children: [
          const CustomAddProductImage(),
          Custom_textFormGlobal(
            label: '32'.tr,
            obscureText: false,
            filled: true,
            controllerForm: controller.title,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).iconTheme.color,
            labelcolor: Theme.of(context).iconTheme.color,
            cursorColor: Theme.of(context).cardColor,
            textcolor: Theme.of(context).textTheme.titleSmall!.color,
            validator: (val) {
              return textformvalidation(7, 100, 'none', val!);
            },
          ),
          Custom_textFormGlobal(
            obscureText: false,
            label: "29".tr,
            maxLines: 3,
            contentpanding: EdgeInsets.all(30.0.r),
            controllerForm: controller.description,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            labelcolor: Theme.of(context).iconTheme.color,
            borderColor: Theme.of(context).iconTheme.color,
            cursorColor: Theme.of(context).cardColor,
            textcolor: Theme.of(context).textTheme.titleSmall!.color,
            validator: (val) {
              return textformvalidation(20, 1000, 'none', val!);
            },
          ),
          const CustomDiscountandCount(),
          const CustomPriceAndCategores(),
        ],
      ),
    );
  }
}
