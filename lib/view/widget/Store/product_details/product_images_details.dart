import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/productofowner/product_details_of_owner_controller.dart';
import 'package:mahaly/core/constant/Links/Links.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/view/widget/profile/snackbar_change_image.dart';

class ShowProductImage extends GetView<ProductDetailsOfOwnerController> {
  const ShowProductImage({
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
        GetBuilder<ProductDetailsOfOwnerController>(builder: (controller) {
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

class CustomConatinerimageProduct
    extends GetView<ProductDetailsOfOwnerController> {
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
                image: NetworkImage(
                    "${Applink.dirImageProduct}/${controller.images[index]['image']}"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20.0.r),
            border: Border.all(color: Theme.of(context).iconTheme.color!),
          ),
        ),
        Positioned(
          top: 10.0,
          child: InkWell(
              onTap: () {
                // controller.images.removeAt(index);
                // controller.update();
                controller.removeimage(controller.images[index]['image_id'],
                    controller.images[index]['image']);
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
