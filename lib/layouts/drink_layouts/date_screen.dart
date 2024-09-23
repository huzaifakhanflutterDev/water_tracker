import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:water_tracker/controllers/clock_controller.dart';
import 'package:water_tracker/controllers/date_controller.dart';

import '../../utils/my_elevated_button.dart';
import '../../utils/my_text.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DateController());
    var timeController = Get.put(ClockController());
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Set time & date",
          color: Color(0xff232526),
          size: 20,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    DateTime focusedDay = controller.selectedDays.isNotEmpty
                        ? controller.selectedDays.last
                        : DateTime.now();
                    return TableCalendar(
                      calendarStyle: CalendarStyle(
                        selectedTextStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4E88F4)),
                        todayTextStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF)),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xff4E88F4).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(Get.height * .5.sp),
                        ),
                        markerDecoration: BoxDecoration(
                          color: Color(0xff4E88F4),
                          borderRadius: BorderRadius.circular(Get.height * .5.sp),
                        ),
                        todayDecoration: BoxDecoration(
                          color: Color(0xff4E88F4),
                          borderRadius: BorderRadius.circular(Get.height * .5.sp),
                        ),
                      ),
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2200, 3, 14),
                      focusedDay: focusedDay,
                      currentDay: DateTime.now(),
                      selectedDayPredicate: (day) {
                        return controller.selectedDays.contains(day);
                      },
                      pageAnimationDuration: Duration(milliseconds: 500),
                      pageAnimationCurve: Curves.easeIn,
                      rowHeight: 40.sp,
                      onDaySelected: (selectDay, focusedDay) {
                        controller.onSelectedDay(selectDay);
                      },
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        leftChevronPadding: EdgeInsets.all(20.sp),
                        rightChevronPadding: EdgeInsets.all(20.sp),
                      ),
                      availableGestures: AvailableGestures.all,
                    );
                  }).paddingSymmetric(horizontal: 0.sp, vertical: 10.sp),
                  MyText(
                    text: "Set time",
                    color: Color(0xff232526),
                    size: 15,
                    weight: FontWeight.w700,
                  ).paddingSymmetric(horizontal: 8.sp, vertical: 10.sp),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg_icons/Alarm.svg",
                      ).paddingSymmetric(horizontal: 5.sp),
                      Obx(() {
                        var time = timeController.selectedTime.value;
                        var formatedTime =
                            "${time.hour % 12 == 0 ? 12 : time.hour % 12} : ${time.minute.toString().padLeft(2, '0')} ${time.hour >= 12 ? "PM" : "AM"}";

                        return Container(
                          width: Get.width *.275.sp,
                          height: 25.sp,
                          child: TextFormField(
                            onTap: () async {
                              var newTime = await showTimePicker(
                                context: context,
                                cancelText: "Cancel",
                                confirmText: "OK",
                                initialTime: time,
                              );
                              if (newTime != null) {
                                timeController.updatedTime(newTime);
                              }
                            },
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000),
                                fontFamily: "Jakarta"),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0.sp, vertical: 0),
                              hintText: formatedTime,
                              hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),
                                  fontFamily: "Jakarta"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 10.sp),
            ),
          ),
          ElevatedBtn(
            onPressed: () {
              Get.to(() => DateScreen());
            },
            text: MyText(
              text: "Set now",
              size: 13,
              weight: FontWeight.w500,
              color: Color(0xffFFFFFF),
            ),
          ).paddingSymmetric(
              vertical: 12.sp, horizontal: 15.sp)
        ],
      ),
    );
  }
}
