import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Store/store_controller.dart';
import 'package:mahaly/core/constant/image/imageapp.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/view/widget/Store/Custom_appBar.dart';
import 'package:mahaly/view/widget/Store/custom_manage_store.dart';

class StoreOpen extends StatelessWidget {
  const StoreOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 3.h,
          ),
          child: Custom_appBar(
            namestore: 'Name Store',
            image: ImageApp.logo,
            ontapchangephoto: () {},
          )),
      body: const CsutomBodyOpenStore(),
    );
  }
}

class CsutomBodyOpenStore extends GetView<StoreController> {
  const CsutomBodyOpenStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        CustomManageStore(
          image: "assets/images/category.png",
          title: "Categores",
          color: ColorApp.primary,
          ontap: () {},
        ),
        CustomManageStore(
          image: "assets/images/product.png",
          title: "Items",
          color: ColorApp.sixth,
          ontap: () {},
        ),
        CustomManageStore(
          image: "assets/images/orders.png",
          title: "Orders",
          color: ColorApp.second,
          ontap: () {},
        ),
        CustomManageStore(
          image: "assets/images/inforamtion.png",
          title: "Information",
          color: ColorApp.fifth,
          ontap: controller.gotoStoreInfoPage,
        ),
      ],
    );
  }
}
