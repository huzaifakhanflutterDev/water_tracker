import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatelessWidget {
  String title, hint;
  double fontsize;
  Widget suffix;

  String? Function(String?)? validator;

  MyTextField({
    this.validator,
    this.suffix = const Text(""),
    this.title = '',
    required this.hint,
    this.fontsize = 0,
  });

  @override
  Widget build(BuildContext context) {
    // var clicked = false.obs;
    // var clicked1 = false.obs;
    // var controller = Get.put(TextController());

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.sp),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 10.sp,
      //   vertical: 6.sp,
      // ),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(
          color: Color(0xffDFE1E7),
          width: 0.9.sp,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
                color: Color(0xff000000),
              ),
            ).paddingOnly(left: 8.sp, top: 4.sp),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            onChanged: (newtext) {
              // controller.selectedText(newtext);
            },
            keyboardType: TextInputType.number,
            style: TextStyle(
                fontSize: fontsize.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
                fontFamily: "Jakarta"),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 8.sp, vertical: 0),
              hintText: hint,
              hintStyle: TextStyle(
                  fontSize: fontsize.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffAEAEAE),
                  fontFamily: "Jakarta"),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: BorderSide.none,
              ),
              suffixIcon: suffix,
            ),
          )
        ],
      ),
    );
  }
}
