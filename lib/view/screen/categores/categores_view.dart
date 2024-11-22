import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/categores/categores_controller.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/core/shared/custom_floating_button.dart';

class CategoresView extends StatelessWidget {
  const CategoresView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoresController controller = Get.put(CategoresController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '37'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      floatingActionButton: CustomFloatingButtomGlobal(
        iconData: Icons.add_outlined,
        title: "43".tr,
        width: 150.0,
        ontap: controller.gotoAddCat,
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoresController>(builder: (controller) {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.categores.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(10.0.r),
          child: ListTile(
            title: Text(
              "${controller.categores[index].categoryName}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              onPressed: () {
                controller.deletecat(
                    controller.categores[index].categoryId, index);
              },
            ),
          ),
        ),
      );
    });
  }
}
