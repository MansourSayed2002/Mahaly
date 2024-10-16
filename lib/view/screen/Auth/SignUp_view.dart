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
              label: "Name",
              suffixicon: Icon(
                Icons.abc_sharp,
                size: 18.0.r,
                color: ColorApp.thierd,
              ),
              validator: (val) {
                return textformvalidation(100, 3, 'name', val!);
              },
            ),
            Custom_textFormGlobal(
              controllerForm: controller.username,
              label: "User Name",
              suffixicon: Icon(
                Icons.person_2_outlined,
                color: ColorApp.thierd,
                size: 18.0.r,
              ),
              validator: (val) {
                return textformvalidation(100, 3, 'username', val!);
              },
            ),
            Custom_textFormGlobal(
              controllerForm: controller.egoogle,
              label: "Email",
              hint: "Enter Email Google",
              suffixicon: Icon(
                Icons.email_outlined,
                color: ColorApp.thierd,
                size: 18.0.r,
              ),
              validator: (val) {
                return textformvalidation(100, 3, 'emailgoogle', val!);
              },
            ),
            Custom_textFormGlobal(
              controllerForm: controller.phone,
              label: "Phone",
              suffixicon: Icon(
                Icons.phone,
                color: ColorApp.thierd,
                size: 18.0.r,
              ),
              validator: (val) {
                return textformvalidation(100, 3, 'phone', val!);
              },
            ),
            Custom_textFormGlobal(
              controllerForm: controller.password,
              label: "Password",
              suffixicon: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.remove_red_eye_outlined,
                    color: ColorApp.thierd,
                    size: 18.0.r,
                  )),
              validator: (val) {
                return textformvalidation(100, 3, 'password', val!);
              },
            ),
            Custom_buttomPublic(
              title: "Create",
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
