import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Custom_textFormGlobal extends StatelessWidget {
  const Custom_textFormGlobal({
    super.key,
    required this.label,
    this.hint,
    this.controllerForm,
    this.suffixicon,
    this.validator,
  });
  final String label;
  final String? hint;
  final TextEditingController? controllerForm;
  final Widget? suffixicon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0.r),
      child: TextFormField(
        validator: validator,
        controller: controllerForm,
        style: TextStyle(
          color: ColorApp.thierd,
          fontSize: 20.0.sp,
        ),
        cursorColor: ColorApp.thierd,
        decoration: InputDecoration(
            fillColor: ColorApp.thierd,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(label),
            suffixIcon: suffixicon,
            hintText: hint,
            hintStyle: TextStyle(
              color: ColorApp.thierd,
              fontSize: 15.0.sp,
            ),
            labelStyle: TextStyle(
              color: ColorApp.second,
              fontSize: 20.0.sp,
            ),
            contentPadding: EdgeInsets.all(10.0.r),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorApp.second,
              ),
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorApp.thierd,
              ),
              borderRadius: BorderRadius.circular(20.0.r),
            )),
      ),
    );
  }
}
