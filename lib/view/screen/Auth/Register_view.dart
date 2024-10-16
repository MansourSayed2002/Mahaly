import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Auth/Register_controller.dart';
import 'package:mahaly/core/constant/image/imageapp.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/Validation/validation.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/shared/Custom_bottonINKGlobal.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/view/widget/Auth/Custom_logo.dart';

class Register_view extends StatelessWidget {
  const Register_view({super.key});

  @override
  Widget build(BuildContext context) {
    Register_Controller controller = Get.put(Register_Controller());
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Padding(
        padding: EdgeInsets.all(6.0.r),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              Custom_logo(
                image: ImageApp.logo,
                height: 300.0.h,
                width: 400.0.w,
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
                  return textformvalidation(3, 100, 'username', val!);
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
                  return textformvalidation(3, 100, 'password', val!);
                },
              ),
              Custom_bottonINKGlobal(
                mainalighnment: MainAxisAlignment.center,
                ontap: () {
                  controller.gotoCheckUsername();
                },
                body: "?Forget password",
                title: "Reset",
              ),
              Custom_buttomPublic(
                title: "Register",
                color: ColorApp.second,
                ontap: () {
                  controller.checkvalidate();
                },
                colortext: ColorApp.thierd,
              ),
              heightsizedBox(30.0.h),
              Custom_bottonINKGlobal(
                mainalighnment: MainAxisAlignment.center,
                ontap: () {
                  controller.gotosignup();
                },
                body: "You don't Have Email ? Go",
                title: "SignUP",
              )
            ],
          ),
        ),
      ),
    );
  }
}
