import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/productofowner/add_product_controller.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';

class CustomPriceAndCategores extends GetView<AddProductController> {
  const CustomPriceAndCategores({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Custom_textFormGlobal(
            label: '35'.tr,
            obscureText: false,
            filled: true,
            controllerForm: controller.price,
            keyboardtype: TextInputType.number,
            contentpanding: EdgeInsets.all(15.0.r),
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).iconTheme.color,
            labelcolor: Theme.of(context).iconTheme.color,
            cursorColor: Theme.of(context).cardColor,
            textcolor: Theme.of(context).textTheme.titleSmall!.color,
            validator: (val) {
              return textformvalidation(1, 100, 'none', val!);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: PopupMenuButton(
              child: Container(
                margin: EdgeInsets.all(10.0.r),
                padding: EdgeInsets.all(10.0.r),
                width: 120.0.w,
                height: 55.0.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0.r),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2.0.w)),
                child: Row(
                  children: [
                    Icon(
                      Icons.category_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 25.0.r,
                    ),
                    widthsizedBox(20.0),
                    Text('37'.tr)
                  ],
                ),
              ),
              itemBuilder: (context) => List.generate(
                    controller.categores.length,
                    (index) => PopupMenuItem(
                      child: Text(
                        '${controller.categores[index].categoryName}',
                        style: Textstyledynamic.black18normal,
                      ),
                      onTap: () {
                        controller.cat =
                            controller.categores[index].categoryId!;
                      },
                    ),
                  )),
        ),
      ],
    );
  }
}
