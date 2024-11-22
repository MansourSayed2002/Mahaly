import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/productofowner/product_details_of_owner_controller.dart';
import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/text_form_global.dart';

class CustomPriceAndCategoresDetails
    extends GetView<ProductDetailsOfOwnerController> {
  const CustomPriceAndCategoresDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextFormGlobal(
            label: '35'.tr,
            obscureText: false,
            filled: true,
            cursorColor: Colors.black,
            controllerForm: controller.price,
            keyboardtype: TextInputType.number,
            textcolor: Theme.of(context).hintColor,
            contentpanding: EdgeInsets.all(15.0.r),
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).iconTheme.color,
            labelcolor: Theme.of(context).iconTheme.color,
            validator: (val) {
              return textformvalidation(1, 100, 'none', val!);
            },
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.all(10.0.r),
          padding: EdgeInsets.all(10.0.r),
          width: 120.0.w,
          height: 75.0.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '37'.tr,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).iconTheme.color,
                    fontSize: 15.0.sp),
              ),
              Text(
                '${controller.productsOfAdminModel.categoryName}',
              ),
            ],
          ),
        ))
      ],
    );
  }
}
