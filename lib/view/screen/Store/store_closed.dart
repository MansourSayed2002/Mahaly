import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mahaly/controller/Store/store_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/shared/button_dialog.dart';

class CloseStore extends GetView<StoreController> {
  const CloseStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0.r),
          padding: EdgeInsets.all(20.0.r),
          decoration: BoxDecoration(
              color: ColorApp.primary,
              borderRadius: BorderRadius.circular(20.0.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Store Is Closed If You Want Open Your Store Click Open',
                style: Textstyledynamic.white20Bold,
                textAlign: TextAlign.center,
              ),
              heightsizedBox(10.0),
              ButtonDialog(
                colorbutton: ColorApp.sixth,
                textStyletitle: Textstyledynamic.white20Bold,
                ontap: controller.goToCreateStorePage,
                title: 'Open',
              )
            ],
          ),
        ),
      ),
    );
  }
}
