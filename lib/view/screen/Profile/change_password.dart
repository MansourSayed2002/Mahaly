import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Profile/setting_profile.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/Validation/validation.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/view/widget/Forgetpassword/Custom_explorePage.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingProfileController());
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
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<SettingProfileController> {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        heightsizedBox(100.0.h),
        const Custom_explorePage(
          title: 'Change Password',
          body: 'Please Enter Your New Password ',
        ),
        heightsizedBox(10.0.h),
        Custom_textFormGlobal(
          label: 'Old Password',
          hint: 'Enter Password',
          controllerForm: controller.oldpassword,
          suffixicon: const Icon(Icons.email_outlined),
          obscureText: false,
          validator: (val) {
            return textformvalidation(3, 100, 'name', val!);
          },
        ),
        Custom_textFormGlobal(
          label: 'New Password',
          hint: 'Enter Reset Password',
          controllerForm: controller.newpassword,
          suffixicon: const Icon(Icons.email_outlined),
          obscureText: false,
          validator: (val) {
            return textformvalidation(3, 100, 'name', val!);
          },
        ),
        Custom_buttomPublic(
          title: 'Sure',
          color: ColorApp.second,
          colortext: ColorApp.thierd,
          ontap: () {
            controller.changePassword();
          },
        )
      ],
    );
  }
}
