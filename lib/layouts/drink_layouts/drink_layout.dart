import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/animation_controller.dart';
import 'package:water_tracker/layouts/drink_layouts/drink_screen_layout.dart';
import 'package:water_tracker/utils/my_text.dart';

class DrinkLayout extends StatelessWidget {
  const DrinkLayout({super.key});

  @override
  Widget build(BuildContext context) {
    StateMachineController? stateController;
    SMIInput<double>? inputValue;
    var controller = Get.put(MyAnimationController());
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: "Maintain Hydration",
              color: Color(0xff232526),
              size: 20,
              weight: FontWeight.w500,
            ),
            MyText(
              text: "Keep Your Fluids Up",
              color: Color(0xff878C90),
              size: 12,
              weight: FontWeight.w400,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Color(0xffFFFFFF),
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Your daily targets",
                    family: "Gilroy",
                    color: Color(0xff21293D),
                    size: 12,
                    weight: FontWeight.w300,
                  ).paddingOnly(top: 6.sp, left: 8.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [0, 1, 2, 3, 4, 5, 6]
                        .map((index) => DrinkScreenLayout(index: index))
                        .toList(),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.sp, horizontal: 6.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.height * .02.sp),
                      border: Border.all(
                        color: Color(0xff327AC9),
                        width: 0.32,
                      ),
                    ),
                    child: LinearPercentIndicator(
                      restartAnimation: false,
                      alignment: MainAxisAlignment.start,
                      curve: Curves.easeIn,
                      animation: true,
                      animationDuration: 2000,
                      progressColor: Color(0xff327AC9),
                      percent: .54,
                      padding: EdgeInsets.all(1.sp),
                      backgroundColor: Color(0xffFFFFFF),
                      lineHeight: 20.sp,
                      barRadius: Radius.circular(12.sp),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Average Completion Percentage:",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " 54%",
                          style: TextStyle(
                            color: Color(0xff327AC9),
                            fontSize: 12.sp,
                            fontFamily: "Dmsans",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(bottom: 8.sp, left: 8.sp),
                ],
              ).paddingSymmetric(horizontal: 6.sp, vertical: 8.sp),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 0.sp),
              color: Color(0xffFFFFFF),
              elevation: 0,
              child: Stack(
                children: [
                  Positioned(
                    left: -Get.width * .15.sp,
                    top: 0,
                    bottom: Get.height * .245.sp,
                    child: Container(
                      height: Get.height * .075.sp,
                      width: Get.width * .5.sp,
                      child: RiveAnimation.asset(
                        "assets/rive/glass.riv",
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.fitHeight,
                        onInit: (artBoard) {
                          stateController = StateMachineController.fromArtboard(
                            artBoard,
                            "default",
                          );
                          if (stateController == null) {
                            return;
                          }
                          artBoard.addController(stateController!);
                          inputValue = stateController?.findInput("input");
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    // left: Get.width * .325.sp,
                    right: 0,
                    top: 0,
                    bottom: Get.height * .375.sp,
                    child: Container(
                      height: Get.height * .15.sp,
                      width: Get.width * 0.425.sp,
                      child: Lottie.asset("assets/animations/wave_line.json"),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width * .4.sp,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "Goal",
                                          color: Color(0xff878C90),
                                          size: 10,
                                          weight: FontWeight.w400,
                                        ),
                                        MyText(
                                          text: "1000ml",
                                          color: Color(0xff232526),
                                          size: 16,
                                          family: "Dmsans",
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "Completed",
                                          color: Color(0xff878C90),
                                          size: 10,
                                          weight: FontWeight.w400,
                                        ),
                                        MyText(
                                          text: "54%",
                                          color: Color(0xff232526),
                                          size: 16,
                                          family: "Dmsans",
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(vertical: 5.sp),
                              ),
                              SizedBox(
                                height: Get.height * .1.sp,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFFDCD1),
                                  elevation: 0,
                                  surfaceTintColor: Color(0xffFFDCD1),
                                  minimumSize: Size(
                                      Get.width * .1.sp, Get.height * 0.04.sp),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                ).copyWith(
                                  elevation: ButtonStyleButton.allOrNull(
                                      0), // No elevation on press
                                ),
                                onPressed: () {},
                                child: MyText(
                                  text: "Almost There, Champ",
                                  size: 10,
                                  weight: FontWeight.w400,
                                  color: Color(0xffF76B40),
                                ),
                              ),
                            ],
                          ).paddingSymmetric(
                              horizontal: 0.sp,
                              vertical: Get.height * .0075.sp),
                        ],
                      ).paddingOnly(bottom: Get.height * .035.sp),
                      Divider(
                        color: Color(0xffF2F2F2),
                      ).paddingSymmetric(horizontal: 12.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                top: Get.height * .1175.sp,
                                right: 0,
                                left: Get.width * .14.sp,
                                child: MyText(
                                  text: "73%",
                                ),
                              ),
                              Transform.rotate(
                                angle: 4.7,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: Get.height * .04.sp,
                                  ),
                                  height: Get.height * .175.sp,
                                  width: Get.width * .35.sp,
                                  child: PieChart(
                                    PieChartData(
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 50,
                                      sections: [
                                        PieChartSectionData(
                                          color: Color(0xffB4179D),
                                          radius: 30.sp,
                                          value: 90,
                                          showTitle: false,
                                        ),
                                        PieChartSectionData(
                                          color: Color(0xffFFC300),
                                          radius: 25.sp,
                                          value: 35,
                                          showTitle: false,
                                        ),
                                        PieChartSectionData(
                                          color: Color(0xff2D2FF0),
                                          radius: 20.sp,
                                          value: 30,
                                          showTitle: false,
                                        ),
                                        PieChartSectionData(
                                          color: Color(0xffB6B6B6)
                                              .withOpacity(0.2),
                                          radius: 15.sp,
                                          value: 25,
                                          showTitle: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [0, 1, 2, 3].map(
                              (index) {
                                var colors = [
                                  Color(0xffB4179D),
                                  Color(0xffFFC300),
                                  Color(0xff2D2FF0),
                                  Color(0xffDEDEDE),
                                ];
                                var names = [
                                  "Water",
                                  "Coke",
                                  "Juice",
                                  "Coffee",
                                ];
                                return Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.sp),
                                      height: Get.height * .025,
                                      width: Get.width * .055,
                                      decoration: BoxDecoration(
                                          color: colors[index],
                                          borderRadius: BorderRadius.circular(
                                              Get.height * .005.sp)),
                                    ),
                                    MyText(
                                      text: names[index],
                                      size: 12,
                                      weight: FontWeight.w400,
                                    )
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      )
                    ],
                  ).paddingOnly(right: Get.width * .0175.sp),
                ],
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 10.sp, vertical: 8.sp),
      ),
    );
  }
}
