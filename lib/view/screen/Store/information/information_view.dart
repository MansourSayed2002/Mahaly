import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/image/imageapp.dart';
import 'package:mahaly/core/shared/button_appbar_back.dart';
import 'package:mahaly/view/widget/profile/container_show_info.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
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
          CircleAvatar(
            radius: 80.0.r,
            backgroundImage: const AssetImage(ImageApp.logo),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 60.0.r,
                  color: Colors.white,
                )),
          ),
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
