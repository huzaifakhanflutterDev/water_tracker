import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/slider_controller.dart';
import 'package:water_tracker/layouts/home_layout/bottom_layout.dart';
import 'package:water_tracker/utils/my_elevated_button.dart';
import 'package:water_tracker/utils/my_text.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SliderController());
    return Container(
      height: 700.sp,
      width: Get.width.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.sp),
          topRight: Radius.circular(20.sp),
        ),
        color: Color(0xffFFFFFF),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.sp),
                height: 3.sp,
                width: Get.width * .075.sp,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              MyText(
                text: "What Did You Drink?",
                size: 14,
                weight: FontWeight.w500,
              ).paddingOnly(
                bottom: Get.height * .02.sp,
              ),
              Wrap(
                children: List.generate(
                  4,
                  (index) {
                    return BottomLayout(index: index);
                  },
                ),
              ),
              SizedBox(
                height: 80.sp,
              ),
              MyText(
                text: "How Much Did You Drink?",
                size: 14,
                weight: FontWeight.w500,
              ).paddingOnly(bottom: 10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "500",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Dmsans",
                          ),
                        ),
                        TextSpan(
                          text: " ml",
                          style: TextStyle(
                            color: Color(0xff000000).withOpacity(0.4),
                            fontSize: 12.sp,
                            fontFamily: "Dmsans",
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 18.sp),
              Container(
                height: 20.sp,
                child: Obx(() {
                  return Slider(
                    min: 0,
                    max: 1000,
                    value: controller.selectedIndex.value,
                    onChanged: (value) {
                      controller.onChanges(value);
                    },
                    activeColor: Color(0xff4E88F4),
                    inactiveColor: Color(0xffF2F2F2),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return MyText(
                      text: controller.selectedIndex.value
                              .toStringAsFixed(0) +
                          "ml",
                      size: 12,
                      family: "Dmsans",
                      color: Color(0xff4E88F4),
                      weight: FontWeight.w500,
                    );
                  }),
                  MyText(
                    text: "1000ml",
                    size: 12,
                    family: "Dmsans",
                    color: Color(0xff4E88F4),
                    weight: FontWeight.w500,
                  ),
                ],
              ).paddingOnly(
                bottom: Get.height * .05.sp,
                left: Get.width * .0455.sp,
                right: Get.width * .0455.sp,
              )
            ],
          ),
          ElevatedBtn(
            onPressed: () {},
            text: MyText(
              text: "Add Reminder",
              size: 13,
              weight: FontWeight.w500,
              color: Color(0xffFFFFFF),
            ),
          ).paddingSymmetric(
              vertical: Get.height * .01.sp,
              horizontal: Get.width * .035.sp),
        ],
      ),
    );
  }
}
