import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Resetpassword/CheckUsername_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/Validation/validation.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/view/widget/Forgetpassword/Custom_explorePage.dart';

class CheckUsername_view extends StatelessWidget {
  const CheckUsername_view({super.key});

  @override
  Widget build(BuildContext context) {
    CheckUsernamecontroller controller = Get.put(CheckUsernamecontroller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorApp.primary,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_rounded,
            color: ColorApp.thierd,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: ColorApp.primary,
      body: Form(
        key: controller.formstate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            heightsizedBox(100.0.h),
            const Custom_explorePage(
              title: 'Check UserName',
              body: 'Please enter your username to verify it',
            ),
            heightsizedBox(10.0.h),
            Custom_textFormGlobal(
              label: 'Email',
              hint: 'Enter Email Google',
              controllerForm: controller.egoogle,
              suffixicon: const Icon(Icons.email_outlined),
              validator: (val) {
                return textformvalidation(3, 100, 'emailgoogle', val!);
              },
            ),
            Custom_buttomPublic(
              title: 'Check',
              color: ColorApp.second,
              colortext: ColorApp.thierd,
              ontap: () {
                controller.checkvalidate();
              },
            )
          ],
        ),
      ),
    );
  }
}
