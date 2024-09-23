import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/reminder_controller.dart';

import '../../../utils/my_text.dart';

class CompletedLayout extends StatelessWidget {
  int index;

  CompletedLayout({required this.index});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ReminderController());

    var listDays = [
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
    ];

    return GestureDetector(
      onTap: () {
        controller.onChanges(index);
      },
      child: Container(
        height: Get.height * .085.sp,
        width: Get.width * .092.sp,
        margin: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 2.sp),
        decoration: BoxDecoration(
          color: Color(0xff0EAD69),
          borderRadius: BorderRadius.circular(6.sp),
          border: Border.all(
            color: Color(0xff327AC9),
            width: 0.32,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Icon(
                Icons.check,
                size: 12.sp,
                color: Color(0xff0EAD69),
              ),
            ),
            MyText(
              text: listDays[index],
              size: 11,
              color: Color(0xffffffff),
              weight: FontWeight.w500,
            ).paddingSymmetric(vertical: 4.sp, horizontal: 0.sp)
          ],
        ),
      ).paddingOnly(right: 2.sp),
    );
  }
}
