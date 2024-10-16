import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/data/Source/static/ElementStore.dart';
import 'package:mahaly/view/widget/PageStore/Custom_appBar.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

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
            ontapchangephoto: () {},
          )),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: elementStore.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(10.0.r),
            padding: EdgeInsets.all(10.0.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0.r),
                color: elementStore[index].color,
                image: DecorationImage(
                    image: AssetImage(elementStore[index].image),
                    fit: BoxFit.contain)),
            child: Text(
              elementStore[index].title,
              style: Textstyledynamic.white20Bold,
            )),
      ),
    );
  }
}
