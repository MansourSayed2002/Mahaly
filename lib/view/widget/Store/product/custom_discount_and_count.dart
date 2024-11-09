import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/product/add_product_controller.dart';
import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';

class CustomDiscountandCount extends GetView<AddProductController> {
  const CustomDiscountandCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Custom_textFormGlobal(
            label: '33'.tr,
            obscureText: false,
            filled: true,
            controllerForm: controller.discount,
            contentpanding: EdgeInsets.all(15.0.r),
            keyboardtype: TextInputType.number,
            fillColor: Theme.of(context).cardColor,
            borderColor: Theme.of(context).iconTheme.color,
            labelcolor: Theme.of(context).iconTheme.color,
            validator: (val) {
              return textformvalidation(1, 100, 'none', val!);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Custom_textFormGlobal(
            label: '34'.tr,
            obscureText: false,
            filled: true,
            controllerForm: controller.count,
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
    );
  }
}
