import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Profile/Profile_controller.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/change_widget_accordingto_lang.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/view/screen/Auth/SignUp_view.dart';
import 'package:mahaly/view/widget/profile/custom_image_profile.dart';
import 'package:mahaly/view/widget/profile/profile_menu_widget.dart';
import 'package:mahaly/view/widget/profile/snackbar_change_image.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return const Scaffold(
      body: CustomBody(),
    );
  }
}

class CustomBody extends GetView<ProfileController> {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<ProfileController>(builder: (controllerup) {
              return CustomImageProfile(
                image: Sharedpre.getString('user_image'),
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
            Text(
              '${Sharedpre.getString('user_name')}',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 20.0),
            ),
            Text(
              '${Sharedpre.getString('user_username')}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Custom_buttomPublic(
                title: '21'.tr,
                color: Theme.of(context).primaryColor,
                colortext: ColorApp.thierd,
                ontap: () {
                  controller.gotoeditpage();
                },
              ),
            ),
            ProfileMenuWidget(
              title: '26'.tr,
              iconDataleading: Icons.settings_outlined,
              iconDatatrailing: changeWidgetaccordingtoLang(
                Icons.arrow_forward_ios_outlined,
                Icons.arrow_back_ios,
              ),
              ontap: () {
                controller.gotosettingpage();
              },
            ),
            ProfileMenuWidget(
              title: '38'.tr,
              iconDataleading: Icons.info_outline,
              iconDatatrailing: changeWidgetaccordingtoLang(
                Icons.arrow_forward_ios_outlined,
                Icons.arrow_back_ios,
              ),
              ontap: () {
                controller.gotoinfopage();
              },
            ),
            ProfileMenuWidget(
              title: '40'.tr,
              iconDataleading: Icons.logout_outlined,
              iconDatatrailing: Icons.logout_outlined,
              ontap: () {
                controller.logout();
                Get.offAll(() => const Signup_view());
              },
            ),
          ],
        ),
      ),
    );
  }
}
