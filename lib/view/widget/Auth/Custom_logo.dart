import 'package:flutter/material.dart';

class Custom_logo extends StatelessWidget {
  const Custom_logo({
    super.key,
    required this.height,
    required this.image,
    required this.width,
  });
  final image;
  final height;
  final width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
