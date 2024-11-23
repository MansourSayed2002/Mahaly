import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/categores/add_categores_controller.dart';
import 'package:mahaly/core/function/validation/validation.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/core/shared/custom_floating_button.dart';

class AddCategoresView extends StatelessWidget {
  const AddCategoresView({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoresController controller = Get.put(AddCategoresController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '43'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      floatingActionButton: CustomFloatingButtomGlobal(
        iconData: Icons.save_alt_outlined,
        title: "57".tr,
        width: 130.0,
        ontap: controller.checkvalidate,
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<AddCategoresController> {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formsate,
      child: ListView(
        children: [
          Custom_textFormGlobal(
            label: '37'.tr,
            obscureText: false,
            filled: true,
            controllerForm: controller.namecat,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).iconTheme.color,
            labelcolor: Theme.of(context).iconTheme.color,
            textcolor: Theme.of(context).textTheme.titleSmall!.color,
            cursorColor: Theme.of(context).textTheme.titleSmall!.color,
            validator: (val) {
              return textformvalidation(3, 100, 'none', val!);
            },
          ),
        ],
      ),
    );
  }
}
