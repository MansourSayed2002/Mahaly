import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mahaly/controller/product/add_product_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/view/widget/profile/snackbar_change_image.dart';

class CustomAddProductImage extends GetView<AddProductController> {
  const CustomAddProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.rawSnackbar(
              title: '42'.tr,
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
          child: Container(
            width: 50.0.w,
            height: 50.0.h,
            margin: EdgeInsets.all(10.0.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0.r),
              border: Border.all(color: Theme.of(context).iconTheme.color!),
            ),
            child: const Icon(Icons.add_outlined),
          ),
        ),
        GetBuilder<AddProductController>(builder: (controller) {
          return SizedBox(
              width: MediaQuery.of(context).size.width * 3 / 4,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.images.length,
                itemBuilder: (context, index) => CustomConatinerimageProduct(
                  index: index,
                ),
              ));
        })
      ],
    );
  }
}

class CustomConatinerimageProduct extends GetView<AddProductController> {
  const CustomConatinerimageProduct({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80.0.w,
          height: 80.0.h,
          margin: EdgeInsets.all(10.0.r),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(controller.images[index]), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20.0.r),
            border: Border.all(color: Theme.of(context).iconTheme.color!),
          ),
        ),
        Positioned(
          top: 10.0,
          child: InkWell(
              onTap: () {
                controller.images.removeAt(index);
                controller.update();
              },
              child: Container(
                width: 20.0.w,
                height: 20.0.h,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }
}
