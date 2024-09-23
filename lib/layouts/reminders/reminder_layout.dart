import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/slider_controller.dart';
import 'package:water_tracker/layouts/drink_layouts/date_screen.dart';
import 'package:water_tracker/layouts/home_layout/bottom_layout.dart';
import 'package:water_tracker/layouts/reminders/reminder_days_layout.dart';
import 'package:water_tracker/layouts/reminders/water_reminder_layout.dart';
import 'package:water_tracker/utils/my_text.dart';

import '../../utils/my_elevated_button.dart';

class ReminderLayout extends StatelessWidget {
  const ReminderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SliderController());
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Reminders",
          color: Color(0xff232526),
          size: 20,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [0, 1, 2, 3, 4, 5, 6]
                      .map((index) => DaysLayoutScreen(index: index))
                      .toList(),
                ).paddingOnly(bottom: 12.sp),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return WaterReminderLayout(
                        index: index,
                      );
                    }),
              ],
            ).paddingSymmetric(horizontal: 12.sp),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ElevatedBtn(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) {
                    return Container(
                      height: Get.height * .55.sp,
                      width: Get.width.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.sp),
                          topRight: Radius.circular(20.sp),
                        ),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Get.height * .115.sp,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: Get.height * .15.sp,
                              width: double.infinity,
                              child: Lottie.asset(
                                  "assets/animations/wave_line.json",
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 15.sp, bottom: 20.sp),
                                      height: 3.sp,
                                      width: Get.width * .075.sp,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                        BorderRadius.circular(10.sp),
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
                                      children: [0, 1, 2, 3]
                                          .map((index) =>
                                          BottomLayout(index: index))
                                          .toList(),

                                      // children: List.generate(
                                      //   4,
                                      //       (index) {
                                      //     return BottomLayout(index: index);
                                      //   },
                                      // ),
                                    ),
                                    SizedBox(
                                      height: Get.height * .1.sp,
                                    ),
                                    MyText(
                                      text: "How Much Did You Drink?",
                                      size: 14,
                                      weight: FontWeight.w500,
                                    ).paddingOnly(bottom: 10.sp),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.4),
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
                                    ).paddingOnly(bottom: 25.sp),
                                    Container(
                                      height: 20.sp,
                                      width: double.infinity,
                                      child: Obx(() {
                                        return Slider(
                                          min: 0,
                                          max: 1000,
                                          value:
                                          controller.selectedIndex.value,
                                          onChanged: (value) {
                                            controller.onChanges(value);
                                          },
                                          activeColor: Color(0xff4E88F4),
                                          inactiveColor: Color(0xffF2F2F2),
                                        );
                                      }),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(() {
                                          return MyText(
                                            text: controller
                                                .selectedIndex.value
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
                                    ).paddingSymmetric(
                                        horizontal: Get.width * .05.sp)
                                  ],
                                ).paddingOnly(
                                  bottom: Get.height * .005.sp,
                                  left: Get.width * .015.sp,
                                  right: Get.width * .015.sp,
                                ),
                              ),
                              ElevatedBtn(
                                onPressed: () {
                                  Get.to(() => DateScreen());
                                },
                                text: MyText(
                                  text: "Continue",
                                  size: 13,
                                  weight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ).paddingSymmetric(
                                  vertical: 12.sp, horizontal: 15.sp)
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                );
              },
              text: MyText(
                text: "+ Add Drink",
                size: 13,
                weight: FontWeight.w500,
                color: Color(0xffFFFFFF),
              ),
            ).paddingSymmetric(vertical: 12.sp, horizontal: 10.sp),
          ),
        ],
      ),
    );
  }
}
