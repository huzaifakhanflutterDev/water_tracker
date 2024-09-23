import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/controllers/switch_button.dart';
import 'package:water_tracker/layouts/setting_screen/setting_layouts/data_layout.dart';
import 'package:water_tracker/layouts/setting_screen/setting_layouts/setting_layout.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffFAFAFA),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffFAFAFA),
      ),
    );

    var controller = Get.put(SwitchController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19.sp,
                color: Color(0xff000000),
              ),
            ),
            Text(
              "Change your options",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff0D0D0D).withOpacity(0.03),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: settingData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SettingLayout(
                    title: settingData[index]['title']!,
                    subtitle: settingData[index]["subtitle"]!,
                    index: index,
                  );
                }),
          ),
          Divider(
            height: Get.height * .09.sp,
            color: Color(0xff0D0D0D).withOpacity(0.2),
            thickness: 1,
          ).paddingSymmetric(horizontal: 22.sp, vertical: 5.sp),
          ...List.generate(2, (index) {
            var images = [
              "assets/svg_icons/clock.svg",
              "assets/svg_icons/notifications.svg"
            ];
            var names = [
              " Alarm",
              "Notifications",
            ];

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        images[index],
                      ).paddingSymmetric(
                        horizontal: 3.sp,
                      ),
                      Text(
                        names[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () {
                    return Transform.scale(
                      scale: .7,
                      child: Switch(

                        activeTrackColor: Color(0xff4E88F4) ,
                        activeColor: Color(0xff4E88F4),
                        value: index == 0
                            ? controller.selectedSwitch.value
                            : controller.selectedSwitch2.value,
                        onChanged: (value) {
                          if (index == 0) {
                            controller.switched(index);
                          } else {
                            controller.switched2(index);
                          }
                        },
                        thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Color(0xffFFFFFF); // Thumb color when ON
                          }
                          return Color(0xffB0B0B0); // Thumb color when OFF (Grey)
                        }),
                        // thumbColor: WidgetStatePropertyAll(Color(0xff4E88F4)),
                        inactiveTrackColor: Color(0xffFFFFFF),
                      ),
                    );
                  },
                ),
              ],
            ).paddingSymmetric(
              horizontal: 6.sp,
            );
          })
        ],
      ).paddingSymmetric(
        horizontal: 12.sp,
      ),
    );
  }
}
