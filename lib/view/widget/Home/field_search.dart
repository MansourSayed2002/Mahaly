import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class FieldSearch extends StatelessWidget {
  const FieldSearch({
    super.key,
    required this.hint,
    required this.controllerForm,
    required this.onpressed,
  });
  final String hint;
  final TextEditingController controllerForm;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0.r),
      child: TextFormField(
        controller: controllerForm,
        cursorColor: ColorApp.thierd,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorApp.thierd,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 26.0.r,
            ),
            onPressed: onpressed,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 15.0.sp,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.all(12.0.r),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0.r),
          ),
        ),
      ),
    );
  }
}
