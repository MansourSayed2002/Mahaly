import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mahaly/controller/Auth/verifycode_sign_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/view/widget/Forgetpassword/Custom_explorePage.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeSignupview extends StatelessWidget {
  const VerifyCodeSignupview({super.key});

  @override
  Widget build(BuildContext context) {
    VerifycodeSigncontroller controller = Get.put(VerifycodeSigncontroller());
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Column(
        children: [
          heightsizedBox(150.0.h),
          const Custom_explorePage(
            title: 'VerifyCode',
            body: 'Please enter your verifycode to check it',
          ),
          heightsizedBox(10.0.h),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Pinput(
              controller: controller.verifycode,
              keyboardType: TextInputType.number,
              length: 5,
              onCompleted: (val) {
                controller.checkverifycode();
              },
            ),
          ),
        ],
      ),
    );
  }
}