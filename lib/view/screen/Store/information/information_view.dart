import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Store/information/information_controller.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/Links/Links.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/view/widget/profile/container_show_info.dart';
import 'package:mahaly/view/widget/profile/custom_image_profile.dart';
import 'package:mahaly/view/widget/profile/snackbar_change_image.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InformationController());
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

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<InformationController>(builder: (controller) {
            return CustomImageProfile(
              dir: "${Applink.dirImagestore}/",
              image: "${Sharedpre.getString('store_image')}",
              ontapchangeimage: () {
                Get.rawSnackbar(
                  title: '41'.tr,
                  backgroundColor: ColorApp.primary,
                  duration: const Duration(seconds: 5),
                  messageText: SnackbarChangeImage(
                    ontapcamera: () async {
                      await controller.opencamera();
                    },
                    ontapgallery: () async {
                      await controller.onpengallery();
                    },
                  ),
                );
              },
            );
          }),
          ContainerShowInfo(
            icon: Icons.abc_outlined,
            title: "${"11".tr}:${Sharedpre.getString('store_name')}",
          ),
          ContainerShowInfo(
            icon: Icons.description_outlined,
            title: "${"29".tr}:${Sharedpre.getString('store_description')}",
          ),
          ContainerShowInfo(
            icon: Icons.sort_outlined,
            title: "${"30".tr}:${Sharedpre.getString('store_rating') ?? "0"}",
          ),
          ContainerShowInfo(
            icon: Icons.date_range_outlined,
            title: "${"16".tr}:${Sharedpre.getString('store_date')}",
          ),
        ],
      ),
    );
  }
}
