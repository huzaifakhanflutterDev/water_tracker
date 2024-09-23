import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WaterLayout extends StatelessWidget {
  int index;

  WaterLayout({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width *.0225.sp),
      margin: EdgeInsets.symmetric(vertical: 4.sp),
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(
          color: Color(0xffDEE8F5),
          width: 0.4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                if (index < 1)
                  SvgPicture.asset(
                    "assets/svg_icons/Alarm.svg",
                  ).paddingSymmetric(horizontal: 3.sp),
                Text.rich(
                  TextSpan(
                    text: index < 1
                        ? "Drink Water Reminder"
                        : index <= 1
                            ? "Juice Reminder"
                            : "Drink Water Reminder ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: index < 1 ? " at 12:00PM" : " at 09:00AM",
                    style: TextStyle(
                      color: Color(0xff327AC9),
                      fontSize: 12.sp,
                      fontFamily: "Gilroy",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (index < 1)
            SvgPicture.asset(
              "assets/svg_icons/Check.svg",
            ),
          if (index >= 1)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/svg_icons/Alarm_Off.svg",
                ).paddingSymmetric(horizontal: 5.sp),
                SvgPicture.asset(
                  "assets/svg_icons/check_circle.svg",
                ),
              ],
            ),
        ],
      ),
    );
  }
}
