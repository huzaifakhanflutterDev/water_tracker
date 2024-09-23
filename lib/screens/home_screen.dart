import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/home_screen_controller.dart';
import 'package:water_tracker/layouts/drink_layouts/drink_layout.dart';
import 'package:water_tracker/layouts/home_layout/home_layout.dart';
import 'package:water_tracker/layouts/reminders/reminder_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xffFAFAFA),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xffFFFFFF),
          systemNavigationBarIconBrightness: Brightness.dark),
    );

    List pollsScreen = [
      HomeLayout(),
      DrinkLayout(),
      ReminderLayout(),
    ];
    var controller = Get.put(HomeScreenController());
    return Scaffold(
      body: Obx(() => pollsScreen[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () {
          return Container(
            height: Get.height * .080.sp,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xff555555).withOpacity(0.1),
                    spreadRadius: 20,
                    blurRadius: 20),
              ],
            ),
            child: BottomNavigationBar(
              selectedFontSize: 11.sp,
              unselectedFontSize: 11.sp,
              showSelectedLabels: true,
              selectedItemColor: Color(0xff327AC9),
              unselectedLabelStyle: TextStyle(
                color: Color(0xff49454F).withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: Color(0xffFFFFFF),
              elevation: 0,
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 3.sp),
                    height: Get.height * .035.sp,
                    width: Get.width * .150.sp,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex == 0
                            ? Color(0xff327AC9)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg_icons/home.svg",
                        color: controller.selectedIndex == 0
                            ? Color(0xffFFFFFF)
                            : Color(0xff49454F).withOpacity(0.6),
                        height: Get.height * .020.sp,
                        width: Get.width * .13.sp,
                      ),
                    ),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 3.sp),
                    height: Get.height * .035.sp,
                    width: Get.width * .135.sp,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex == 1
                            ? Color(0xff327AC9)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg_icons/intake.svg",
                        color: controller.selectedIndex == 1
                            ? Color(0xffFFFFFF)
                            : Color(0xff49454F).withOpacity(0.6),
                        height: Get.height * .0275.sp,
                        width: Get.width * .13.sp,
                      ),
                    ),
                  ),
                  label: "Drink Intake",
                ),
                BottomNavigationBarItem(
                  label: "Reminders",
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 3.sp),
                    height: Get.height * .0325.sp,
                    width: Get.width * .12.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: controller.selectedIndex == 2
                          ? Color(0xff327AC9)
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg_icons/reminder.svg",
                        color: controller.selectedIndex == 2
                            ? Color(0xffFFFFFF)
                            : Color(0xff49454F).withOpacity(0.6),
                        height: Get.height * .025.sp,
                        width: Get.width * .13.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
