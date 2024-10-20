import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Resetpassword/users_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/view/widget/Forgetpassword/custom_container_items.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Userscontroller());
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
        body: const CustomBody());
  }
}

class CustomBody extends GetView<Userscontroller> {
  const CustomBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => Customcontaineritems(
                subtitle: '${controller.data[index]['users_name']}',
                title: '${controller.data[index]['users_username']}',
                index: index,
                onTap: () {
                  controller.chooseusername(
                      controller.data[index]['users_username'], index);
                },
              ),
            ),
          ),
        ),
        Custom_buttomPublic(
          title: 'Check',
          color: ColorApp.second,
          colortext: ColorApp.thierd,
          ontap: () {
            controller.gotoverifycode();
          },
        ),
      ],
    );
  }
}
