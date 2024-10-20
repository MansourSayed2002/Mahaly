import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Profile/edit_info_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';

class EditInfoView extends StatelessWidget {
  const EditInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditInfoController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorApp.primary,
        leading: const Buttonappbarback(),
      ),
      backgroundColor: ColorApp.primary,
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<EditInfoController> {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Custom_textFormGlobal(
          label: '11'.tr,
          obscureText: false,
          controllerForm: controller.name,
        ),
        Custom_textFormGlobal(
          label: '12'.tr,
          obscureText: false,
          controllerForm: controller.username,
        ),
        Custom_textFormGlobal(
          label: '13'.tr,
          obscureText: false,
          controllerForm: controller.egoogle,
        ),
        Custom_textFormGlobal(
          label: '14'.tr,
          obscureText: false,
          controllerForm: controller.phone,
        ),
        Custom_buttomPublic(
          title: '21'.tr,
          colortext: ColorApp.thierd,
          color: ColorApp.second,
          ontap: () {},
        ),
      ],
    );
  }
}
