import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/Home_controller.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/view/widget/Home/Custom_AppBarHome.dart';
import 'package:mahaly/view/widget/Home/custom_card_items.dart';

class Home_view extends StatelessWidget {
  const Home_view({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return const Scaffold(
      body: SliverBody(),
    );
  }
}

class SliverBody extends StatelessWidget {
  const SliverBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          floating: false,
          expandedHeight: 370,
          backgroundColor: ColorApp.primary,
          flexibleSpace: FlexibleSpaceBar(
            background: CustomAppBarHome(),
          ),
        ),
        GetBuilder<HomeController>(builder: (controller) {
          return SliverGrid.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) => CustomCardItems(
              image: "${controller.items[index].image}",
              title: '${controller.items[index].productTitle}',
              price: " ${controller.items[index].productCategory}",
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.8 / 4,
            ),
          );
        })
      ],
    );
  }
}
