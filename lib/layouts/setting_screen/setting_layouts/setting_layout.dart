import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SettingLayout extends StatelessWidget {
  String title , subtitle;
  int index;

  SettingLayout({
    required this.index ,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 18.sp),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: Color(0xff000000),
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: Color(0xff0D0D0D).withOpacity(0.5),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.sp,
          ),
        ),
        if(index <= 2)
          Divider(
            height: 2,
            color: Color(0xff0D0D0D).withOpacity(0.2),
            thickness: 1,
          ).paddingSymmetric(horizontal: 22.sp, vertical: 5.sp),
      ],
    );
  }
}
