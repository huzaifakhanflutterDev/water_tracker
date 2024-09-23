import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ElevatedBtn extends StatelessWidget {
  VoidCallback? onPressed;
  Widget text;
  Color color;

  ElevatedBtn({
    required this.onPressed,
    this.color = const Color(0xff327AC9),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        surfaceTintColor: Colors.transparent,

        minimumSize: Size(Get.width.sp, Get.height * 0.065.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0),
      ),
      onPressed: onPressed,
      child: text.paddingSymmetric(
        horizontal: Get.width * .1.sp,
        vertical: 8.sp,
      ),
    );
  }
}
