import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/bottom_controller.dart';

import '../../utils/my_text.dart';

class BottomLayout extends StatelessWidget {
  int index;

  BottomLayout({required this.index});

  @override
  Widget build(BuildContext context) {
    var images = [
      "assets/svg_icons/glass.svg",
      "assets/svg_icons/coke.svg",
      "assets/svg_icons/coffee.svg",
      "assets/svg_icons/tea.svg",
    ];

    var names = [
      "Water",
      "Coke",
      "Coffee",
      "Juice",
    ];
    var controller = Get.put(BottomController());
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            controller.onSelected(index);
          },
          child: Container(
            width: Get.width * .175.sp,
            height: Get.height * .08.sp,
            margin: EdgeInsets.symmetric(horizontal: 4.sp),
            decoration: BoxDecoration(
              color: controller.selectedIndex.value == index
                  ? Color(0xff327AC9)
                  : Color(0xffFFFFFF),
              border: Border.all(
                width: 1.06,
                color: controller.selectedIndex.value == index
                    ? Colors.transparent
                    : Color(0xffEAEBEC),
              ),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    images[index],
                    height: Get.height * 0.025.sp,
                    color: controller.selectedIndex.value == index
                        ? Color(0xffFFFFFF)
                        : Color(0xffC6BFD2),
                  ),
                  SizedBox(
                    height: 7.5.sp,
                  ),
                  MyText(
                    text: names[index],
                    size: 10,
                    weight: FontWeight.w500,
                    color: controller.selectedIndex.value == index
                        ? Color(0xffFFFFFF)
                        : Color(0xff878C90),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
