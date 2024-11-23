import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/productofowner/product_details_of_owner_controller.dart';
import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/text_form_global.dart';

class CustomDiscountandCountDetails
    extends GetView<ProductDetailsOfOwnerController> {
  const CustomDiscountandCountDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextFormGlobal(
            label: '33'.tr,
            obscureText: false,
            filled: true,
            cursorColor: Colors.black,
            controllerForm: controller.discount,
            contentpanding: EdgeInsets.all(15.0.r),
            keyboardtype: TextInputType.number,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).iconTheme.color,
            textcolor: Theme.of(context).hintColor,
            labelcolor: Theme.of(context).iconTheme.color,
            validator: (val) {
              return textformvalidation(1, 100, 'none', val!);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: TextFormGlobal(
            label: '34'.tr,
            obscureText: false,
            filled: true,
            cursorColor: Colors.black,
            controllerForm: controller.count,
            keyboardtype: TextInputType.number,
            contentpanding: EdgeInsets.all(15.0.r),
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).iconTheme.color,
            textcolor: Theme.of(context).hintColor,
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
