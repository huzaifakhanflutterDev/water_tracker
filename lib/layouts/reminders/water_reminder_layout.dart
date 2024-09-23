import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class WaterReminderLayout extends StatelessWidget {
  int index;

  WaterReminderLayout({required this.index});

  @override
  Widget build(BuildContext context) {
    var list = [
      "Juice Reminder",
      "Tea Reminder",
      "Coffee Reminder",
      "Coke Reminder",
      "Milk Reminder",
      "Juice Reminder",
      "Water Reminder",
      "Tea Reminder",
      "Coffee Reminder",
      "Water Reminder",
      "Tea Reminder",
      "Coffee Reminder",
    ];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5.sp, ),
      height: Get.height * .05.sp,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular( Get.height * .005.sp),
        border: Border.all(
          color: Color(0xffDEE8F5),
          width: 0.4,
        ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    text: index < 1 ? "Water Reminder" : list[index],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Gilroy",
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: index < 1
                        ? " at 12:00PM"
                        : " at 12:00PM ${DateFormat('dd,yyyy').format(DateTime.now())}",
                    style: TextStyle(
                      color: Color(0xff327AC9),
                      fontSize: 12.sp,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Gilroy"
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
            SvgPicture.asset(
              "assets/svg_icons/delete.svg",
            ),
        ],
      ).paddingSymmetric(horizontal: 15.sp),
    );
  }
}
