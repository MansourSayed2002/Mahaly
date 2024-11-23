import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mahaly/controller/Store/create_store_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/Custom_textFormGlobal.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';

class CreateStore extends StatelessWidget {
  const CreateStore({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateStoreController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Buttonappbarback(),
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends GetView<CreateStoreController> {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80.0.r,
          backgroundColor: ColorApp.fourth,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt_outlined,
                size: 60.0.r,
                color: Colors.white,
              )),
        ),
        Custom_textFormGlobal(
          controllerForm: controller.name,
          label: "11".tr,
          obscureText: false,
          fillColor: Theme.of(context).cardColor,
          borderColor: Theme.of(context).iconTheme.color,
          labelcolor: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        Custom_textFormGlobal(
          controllerForm: controller.description,
          fillColor: Theme.of(context).cardColor,
          label: "29".tr,
          maxLines: 4,
          labelcolor: Theme.of(context).textTheme.bodyMedium!.color,
          contentpanding: EdgeInsets.all(30.0.r),
          obscureText: false,
          borderColor: Theme.of(context).iconTheme.color,
        ),
        Custom_buttomPublic(
          title: "23".tr,
          color: Theme.of(context).primaryColor,
          ontap: () {
            controller.createStore();
          },
          colortext: ColorApp.thierd,
        ),
      ],
    );
  }
}
