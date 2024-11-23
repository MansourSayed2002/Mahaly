import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Auth/Signup_controller.dart';
import 'package:mahaly/core/constant/image/imageapp.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/Validation/validation.dart';
import 'package:mahaly/core/shared/Custom_bottonINKGlobal.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/view/widget/Auth/Custom_logo.dart';

class Signup_view extends StatelessWidget {
  const Signup_view({super.key});

  @override
  Widget build(BuildContext context) {
    Signup_controller controller = Get.put(Signup_controller());
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Form(
        key: controller.formstate,
        child: ListView(
          children: [
            Custom_logo(
              image: ImageApp.logo,
              height: 150.0.h,
              width: 200.0.w,
            ),
            Custom_textFormGlobal(
              controllerForm: controller.name,
              label: "11".tr,
              suffixicon: Icon(
                Icons.abc_sharp,
                size: 18.0.r,
                color: ColorApp.thierd,
              ),
              obscureText: false,
              validator: (val) {
                return textformvalidation(3, 100, 'name', val!);
              },
            ),
            Custom_textFormGlobal(
              controllerForm: controller.username,
              label: "12".tr,
              suffixicon: Icon(
                Icons.person_2_outlined,
                color: ColorApp.thierd,
                size: 18.0.r,
              ),
              obscureText: false,
              validator: (val) {
                return textformvalidation(3, 100, 'username', val!);
              },
            ),
            Custom_textFormGlobal(
              controllerForm: controller.egoogle,
              label: "13".tr,
              hint: "Enter Email Google",
              suffixicon: Icon(
                Icons.email_outlined,
                color: ColorApp.thierd,
                size: 18.0.r,
              ),
              obscureText: false,
              validator: (val) {
                return textformvalidation(3, 100, 'emailgoogle', val!);
              },
            ),
            Custom_textFormGlobal(
              controllerForm: controller.phone,
              label: "14".tr,
              suffixicon: Icon(
                Icons.phone,
                color: ColorApp.thierd,
                size: 18.0.r,
              ),
              obscureText: false,
              validator: (val) {
                return textformvalidation(3, 100, 'phone', val!);
              },
            ),
            GetBuilder<Signup_controller>(builder: (controller) {
              return Custom_textFormGlobal(
                controllerForm: controller.password,
                label: "22".tr,
                suffixicon: InkWell(
                    onTap: () {
                      controller.changeshowpassword();
                    },
                    child: Icon(
                      controller.showpassword == false
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorApp.thierd,
                      size: 18.0.r,
                    )),
                obscureText: controller.showpassword,
                validator: (val) {
                  return textformvalidation(3, 100, 'password', val!);
                },
              );
            }),
            Custom_buttomPublic(
              title: "23".tr,
              color: ColorApp.second,
              ontap: () {
                controller.checkvalidate();
              },
              colortext: ColorApp.thierd,
            ),
            Custom_bottonINKGlobal(
              mainalighnment: MainAxisAlignment.center,
              ontap: () {
                controller.gotoregister();
              },
              body: "You Have Email ? Go",
              title: "Register",
            )
          ],
        ),
      ),
    );
  }
}
