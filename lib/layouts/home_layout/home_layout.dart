import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/slider_controller.dart';
import 'package:water_tracker/layouts/drink_layouts/date_screen.dart';
import 'package:water_tracker/layouts/home_layout/home_data.dart';
import 'package:water_tracker/layouts/home_layout/home_screen_layout.dart';
import 'package:water_tracker/layouts/setting_screen/setting_screen.dart';
import 'package:water_tracker/utils/my_elevated_button.dart';
import 'package:water_tracker/utils/my_text.dart';

import 'bottom_layout.dart';
import 'completed/completed_layout.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SliderController());
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromRadius(11.sp),
          child: ListTile(
            contentPadding: EdgeInsets.only(
              left: 20.sp,
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Stay Hydrated",
                  color: Color(0xff232526),
                  size: 20,
                  weight: FontWeight.w500,
                ),
                MyText(
                  text: "Track your water intake",
                  color: Color(0xff878C90),
                  size: 11,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => SettingScreen());
                  },
                  child: SvgPicture.asset("assets/svg_icons/menu.svg")
                      .paddingSymmetric(
                    vertical: 10.sp,
                    horizontal: 15.sp,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     Get.to(() => CompletedTaskLayout());
                //   },
                //   icon: Icon(Icons.arrow_forward),
                // ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff4E88F4),
                        borderRadius: BorderRadius.circular(23.sp)),
                    margin: EdgeInsets.all(10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Get.height * .042.sp,
                            ),
                            MyText(
                              text: "Achieve Goals",
                              color: Color(0xffFFFFFF),
                              size: 16,
                              weight: FontWeight.w400,
                            ),
                            MyText(
                              text: "54%",
                              color: Color(0xffFFFFFF),
                              size: 28,
                              weight: FontWeight.w600,
                              family: "Dmsans",
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 12.sp, horizontal: 12.sp),
                              child: LinearPercentIndicator(
                                restartAnimation: false,
                                alignment: MainAxisAlignment.start,
                                curve: Curves.easeIn,
                                animation: true,
                                animationDuration: 2000,
                                progressColor: Color(0xffFFFFFF),
                                percent: .76,
                                padding: EdgeInsets.all(1.sp),
                                backgroundColor:
                                    Color(0xffFFFFFF).withOpacity(0.2),
                                lineHeight: 20.sp,
                                barRadius: Radius.circular(12.sp),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyText(
                                  text: "Remaining",
                                  color: Color(0xffFFFFFF),
                                  size: 11,
                                  weight: FontWeight.w400,
                                ),
                                MyText(
                                  text: "1300ml",
                                  color: Color(0xffFFFFFF),
                                  size: 17,
                                  family: "Dmsans",
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyText(
                                  text: "Target",
                                  color: Color(0xffFFFFFF),
                                  size: 11,
                                  weight: FontWeight.w400,
                                ),
                                MyText(
                                  text: "2600ml",
                                  color: Color(0xffFFFFFF),
                                  size: 17,
                                  family: "Dmsans",
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(
                          horizontal: Get.width * .1.sp,
                          vertical: 5.sp,
                        ),
                        Wrap(
                          children: homeList
                              .map((index) => HomeScreenLayout(data: index))
                              .toList(),
                        ).paddingOnly(top: 12.sp, bottom: 10.sp),
                      ],
                    ),
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: 10,
                  //   itemBuilder: (context, index) {
                  //     return WaterLayout(
                  //       index: index,
                  //     );
                  //   },
                  // ).paddingSymmetric(horizontal: 15.sp, vertical: 4.sp),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          left: -90,
                          right: -90,
                          bottom: 4,
                          // top: 0,
                          child:
                              SvgPicture.asset("assets/svg_icons/layer.svg")),
                      Positioned(
                          left: -40,
                          bottom: 0,
                          top: 25,
                          child: SvgPicture.asset("assets/svg_icons/left.svg")),
                      Positioned(
                          right: -40,
                          bottom: 0,
                          top: 25,
                          child:
                              SvgPicture.asset("assets/svg_icons/right.svg")),
                      SvgPicture.asset("assets/svg_icons/Cup.svg"),
                    ],
                  ).paddingOnly(bottom: Get.height * .0075.sp),
                  MyText(
                    text: "Congratulations!!",
                    color: Color(0xff4E88F4),
                    size: 12,
                    weight: FontWeight.w500,
                  ),
                  MyText(
                    text: "Celebrate your 8-day achievement!",
                    color: Color(0xff000000),
                    size: 12,
                    weight: FontWeight.w400,
                  ).paddingOnly(bottom: Get.height * .0125.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                      7,
                      (index) {
                        return CompletedLayout(
                          index: index,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .08.sp,
                  )
                ],
              ),
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
      ),
    );
  }
}
