import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/Validation/validation.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/view/widget/Forgetpassword/Custom_explorePage.dart';

class Resetpassword_view extends StatelessWidget {
  const Resetpassword_view({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          heightsizedBox(100.0.h),
          const Custom_explorePage(
            title: 'Reset Password',
            body: 'Please Enter Your New Password ',
          ),
          heightsizedBox(10.0.h),
          Custom_textFormGlobal(
            label: 'New Password',
            hint: 'Enter Password',
            suffixicon: const Icon(Icons.email_outlined),
            validator: (val) {
              return textformvalidation(100, 3, 'name', val!);
            },
          ),
          Custom_textFormGlobal(
            label: 'New Password',
            hint: 'Enter Reset Password',
            suffixicon: const Icon(Icons.email_outlined),
            validator: (val) {
              return textformvalidation(100, 3, 'name', val!);
            },
          ),
          Custom_buttomPublic(
            title: 'Check',
            color: ColorApp.second,
            colortext: ColorApp.thierd,
            ontap: () {},
          )
        ],
      ),
    );
  }
}
