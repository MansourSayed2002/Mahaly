import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/product/add_product_controller.dart';
import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/view/widget/Store/product/custom_add_product_images.dart';
import 'package:mahaly/view/widget/Store/product/custom_discount_and_count.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: controller.checkvalidate,
        child: Icon(
          Icons.add_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
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
            fillColor: Theme.of(context).cardColor,
            borderColor: Theme.of(context).iconTheme.color,
            labelcolor: Theme.of(context).iconTheme.color,
            validator: (val) {
              return textformvalidation(7, 100, 'none', val!);
            },
          ),
          Custom_textFormGlobal(
            obscureText: false,
            label: "29".tr,
            maxLines: 3,
            controllerForm: controller.description,
            fillColor: Theme.of(context).cardColor,
            labelcolor: Theme.of(context).iconTheme.color,
            contentpanding: EdgeInsets.all(30.0.r),
            borderColor: Theme.of(context).iconTheme.color,
            validator: (val) {
              return textformvalidation(20, 1000, 'none', val!);
            },
          ),
          const CustomDiscountandCount(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.0.r),
            child: Custom_textFormGlobal(
              label: '35'.tr,
              obscureText: false,
              filled: true,
              controllerForm: controller.price,
              keyboardtype: TextInputType.number,
              contentpanding: EdgeInsets.all(15.0.r),
              fillColor: Theme.of(context).cardColor,
              borderColor: Theme.of(context).iconTheme.color,
              labelcolor: Theme.of(context).iconTheme.color,
              validator: (val) {
                return textformvalidation(1, 100, 'none', val!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
