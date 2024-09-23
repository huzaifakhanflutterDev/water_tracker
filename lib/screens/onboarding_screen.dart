import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/screens/home_screen.dart';
import 'package:water_tracker/utils/my_elevated_button.dart';

import '../utils/my_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffFAFAFA),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffFAFAFA),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/bro2.png",
                      height: Get.height * .32.sp,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .07.sp,
                  ),
                  MyText(
                    align: TextAlign.center,
                    text: "Hydrate Smart, Live Well!",
                    size: 20,
                    weight: FontWeight.w700,
                  ).paddingSymmetric(horizontal: 14.sp),
                  MyText(
                    align: TextAlign.center,
                    text:
                        "Elevate your wellness with reminders to stay refreshed and energized!",
                    color: Color(0xff625D5D),
                    size: 12,
                    weight: FontWeight.w400,
                  ).paddingSymmetric(horizontal: 25.sp, vertical: 10.sp),
                ],
              ),
            ),
            ElevatedBtn(
              onPressed: () async {
                Get.to(() => HomeScreen());
              },
              text: MyText(
                spacing: 1.1,
                text: "Get started".toUpperCase(),
                color: Color(0xffFFFFFF),
                weight: FontWeight.w700,
              ),
            ).paddingSymmetric(vertical: 20.sp, horizontal: 16.sp),
          ],
        ),
      ),
    );
  }
}
