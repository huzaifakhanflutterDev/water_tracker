import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/drink_controller.dart';

import '../../utils/my_text.dart';

class DrinkScreenLayout extends StatelessWidget {
  int index;

  DrinkScreenLayout({required this.index});

  @override
  Widget build(BuildContext context) {
    var litre = [
      "1000ml",
      "800ml",
      "400ml",
      "800ml",
      "1000ml",
      "400ml",
      "800ml",
    ];
    var listDays = [
      "Fri",
      "Sat",
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
    ];
    var controller = Get.put(DrinkController());
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.changeIndex(index);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 0.sp),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? Color(0xff327AC9)
                : Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(Get.height *.005.sp),
            border: Border.all(
              color: Color(0xff327AC9),
              width: 0.32,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: litre[index],
                color: controller.selectedIndex.value == index
                    ? Color(0xffFFFFFF)
                    : Color(0xff21293D),
                size: 8,
                weight: FontWeight.w400,
              ).paddingSymmetric(vertical: 4.sp, horizontal: 4.sp),
              MyText(
                text: listDays[index],
                size: 11,
                color: controller.selectedIndex.value == index
                    ? Color(0xffFFFFFF)
                    : Color(0xff21293D),
                weight: FontWeight.w500,
              ).paddingSymmetric(vertical: 6.sp, horizontal: 0.sp)
            ],
          ),
        ).paddingOnly(right: 4.sp),
      );
    });
  }
}
