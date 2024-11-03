import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/Home_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/shared/logo_app.dart';
import 'package:mahaly/view/widget/Home/choose_product.dart';
import 'package:mahaly/view/widget/Home/field_search.dart';

class Custom_AppBarHome extends GetView<HomeController> {
  const Custom_AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
          color: ColorApp.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0.r),
            bottomRight: Radius.circular(20.0.r),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const LogoApp(),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    size: 25.0.r,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 25.0.r,
                  )),
            ],
          ),
          Text(
            "Find cool product fit\n your style",
            style: Textstyledynamic.white20Bold.copyWith(fontSize: 23.0.sp),
            textAlign: TextAlign.left,
          ),
          heightsizedBox(10.0),
          FieldSearch(
            hint: "Search a product",
            controllerForm: controller.search,
            onpressed: () {},
          ),
          const Choosecategory()
        ],
      ),
    );
  }
}
