import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/my_text.dart';

class HomeScreenLayout extends StatelessWidget {
  Map<String, dynamic> data;

  HomeScreenLayout({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width *0.0125.sp,vertical: Get.height *.007.sp),
      height: Get.height * .1,
      width: Get.width * .35.sp,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(data['img'])
                .paddingSymmetric(vertical: 10.sp, horizontal: 6.sp),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: data['name'],
                  color: Color(0xff878C90),
                  size: 10,
                  weight: FontWeight.w400,
                ),
                MyText(
                  text: data['litre'],
                  color: Color(0xff232526),
                  size: 12,
                  family: "Dmsans",
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ).paddingAll(0.sp),
    );
  }
}
