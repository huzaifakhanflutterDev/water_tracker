import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/reminder_controller.dart';

import '../../utils/my_text.dart';

class DaysLayoutScreen extends StatelessWidget {
  int index;

  DaysLayoutScreen({required this.index});

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

    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.onChanges(index);
        },
        child: Container(
          height: Get.height * .0875.sp,
          width: Get.width * .097.sp,
          margin: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 1.25.sp),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? Color(0xff327AC9)
                : Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(Get.height * .007.sp),
            border: Border.all(
              color: controller.selectedIndex.value == index
                  ? Color(0xff327AC9)
                  : index == 6
                      ? Color(0xffB3B3B3)
                      : Color(0xff327AC9),
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
                  color: controller.selectedIndex.value == index
                      ? Color(0xffFFFFFF)
                      : index == 6
                          ? Color(0xffB3B3B3)
                          : Color(0xff327AC9),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Icon(
                  Icons.check,
                  size: 12.sp,
                  color: controller.selectedIndex.value == index
                      ? Color(0xff327AC9)
                      : Color(0xffFFFFFF),
                ),
              ),
              MyText(
                text: listDays[index],
                size: 11,
                color: controller.selectedIndex.value == index
                    ? Color(0xffFFFFFF)
                    : index == 6
                        ? Color(0xffB3B3B3)
                        : Color(0xff21293D),
                weight: FontWeight.w500,
                family: "Gilroy",
              ).paddingSymmetric(vertical: 4.sp, horizontal: 0.sp)
            ],
          ),
        ).paddingOnly(right: 2.sp),
      );
    });
  }
}
