import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Profile/Profile_controller.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/core/function/change_widget_accordingto_lang.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/view/widget/profile/custom_image_profile.dart';
import 'package:mahaly/view/widget/profile/profile_menu_widget.dart';
import 'package:mahaly/view/widget/profile/snackbar_change_image.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
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
            CustomImageProfile(
              ontapchangeimage: () {
                Get.rawSnackbar(
                  title: 'Change Image',
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
            ),
            Text(
              '${Sharedpre.getString('user_name')}',
              style: Textstyledynamic.white20Bold,
            ),
            Text(
              '${Sharedpre.getString('user_username')}',
              style: Textstyledynamic.white18normal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Custom_buttomPublic(
                title: 'Edit',
                color: ColorApp.second,
                colortext: ColorApp.thierd,
                ontap: () {
                  controller.gotoeditpage();
                },
              ),
            ),
            ProfileMenuWidget(
              title: 'Setting',
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
              title: 'Into',
              iconDataleading: Icons.info_outline,
              iconDatatrailing: changeWidgetaccordingtoLang(
                Icons.arrow_forward_ios_outlined,
                Icons.arrow_back_ios,
              ),
              ontap: () {
                controller.gotoinfopage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
