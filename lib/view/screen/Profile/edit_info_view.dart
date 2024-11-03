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
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          filled: true,
          fillColor: Theme.of(context).cardColor,
          controllerForm: controller.name,
          borderColor: Theme.of(context).iconTheme.color,
          labelcolor: Theme.of(context).iconTheme.color,
        ),
        Custom_textFormGlobal(
          label: '12'.tr,
          obscureText: false,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          controllerForm: controller.username,
          borderColor: Theme.of(context).iconTheme.color,
          labelcolor: Theme.of(context).iconTheme.color,
        ),
        Custom_textFormGlobal(
          label: '13'.tr,
          obscureText: false,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          controllerForm: controller.egoogle,
          borderColor: Theme.of(context).iconTheme.color,
          labelcolor: Theme.of(context).iconTheme.color,
        ),
        Custom_textFormGlobal(
          label: '14'.tr,
          obscureText: false,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          controllerForm: controller.phone,
          borderColor: Theme.of(context).iconTheme.color,
          labelcolor: Theme.of(context).iconTheme.color,
        ),
        Custom_buttomPublic(
          title: '21'.tr,
          colortext: ColorApp.thierd,
          color: Theme.of(context).iconTheme.color!,
          ontap: () {
            controller.updateInfoProfile();
          },
        ),
      ],
    );
  }
}
