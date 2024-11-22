import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class OffLine extends StatelessWidget {
  const OffLine({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                title: Text(
                  'OffLine',
                  style: Textstyledynamic.white20Bold,
                ),
                centerTitle: true,
              ),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.signal_wifi_connected_no_internet_4,
                      size: 100.0.r,
                      color: Colors.red,
                    ),
                    Text(
                      'Oops\nNow we are offline!!',
                      style: Textstyledynamic.black18normal,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
