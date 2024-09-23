import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/utils/my_text.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff4E88F4).withOpacity(0.7),
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Color(0xff4E88F4),
    ));

    Future.delayed(
      Duration(seconds: 3),
      () => Get.offAll(() => OnboardingScreen()),
    );
    return Scaffold(
      backgroundColor: Color(0xff4E88F4),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/bottle.png",
                      height: Get.height * .25.sp,
                    ),
                  ),
                  MyText(
                    text: "Drops Water Tracker",
                    color: Color(0xffFFFFFF),
                    size: 20,
                    weight: FontWeight.w700,
                  ).paddingOnly(bottom: 10.sp),
                  MyText(
                    align: TextAlign.center,
                    text: "Stay hydrated and track your \ndaily water intake",
                    color: Color(0xffFFFFFF).withOpacity(0.7),
                    size: 13,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    child: JumpingDots(
                      color: Colors.white,
                      radius: 6.sp,
                      numberOfDots: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Get.height * .175.sp,
                width: double.infinity,
                child: WaveWidget(
                  duration: 700,
                  config: CustomConfig(
                    gradients: [
                      [Color(0xff6B9CF6), Color(0xff6B9CF6)],
                      [Color(0xff83ACF7), Color(0xff83ACF7)],
                    ],
                    durations: [10000, 7740], //19440
                    heightPercentages: [0.03, 0.45], //, 0.25, 0.30
                  ),
                  size: Size(double.infinity, Get.height * .3.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
