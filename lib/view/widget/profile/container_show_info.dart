import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerShowInfo extends StatelessWidget {
  const ContainerShowInfo({
    super.key,
    required this.icon,
    required this.title,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0.r),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30.0.r,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
