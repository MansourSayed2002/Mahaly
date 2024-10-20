import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/check_store.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/view/widget/profile/container_show_info.dart';

class InfoProfileView extends StatelessWidget {
  const InfoProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorApp.primary,
        leading: const Buttonappbarback(),
      ),
      body: const CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerShowInfo(
          icon: Icons.abc_sharp,
          title: "${"11".tr} : ${Sharedpre.getString('user_name')}",
        ),
        ContainerShowInfo(
          icon: Icons.person_2_outlined,
          title: "${"12".tr} : ${Sharedpre.getString('user_username')}",
        ),
        ContainerShowInfo(
          icon: Icons.email_outlined,
          title: "${"13".tr} : ${Sharedpre.getString('user_egoogle')}",
        ),
        ContainerShowInfo(
          icon: Icons.phone_outlined,
          title: "${"14".tr} : ${Sharedpre.getString('user_phone')}",
        ),
        ContainerShowInfo(
          icon: Icons.store_outlined,
          title:
              "${"15".tr} : ${checkstore(Sharedpre.getString('store_active'))}",
        ),
        ContainerShowInfo(
          icon: Icons.date_range_outlined,
          title:
              "${"16".tr} : ${Sharedpre.getString('user_date').toString().split(" ").first}",
        ),
      ],
    );
  }
}
