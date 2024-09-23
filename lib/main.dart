import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:water_tracker/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            datePickerTheme: DatePickerThemeData(
              // dayBackgroundColor: WidgetStatePropertyAll(Color(0xff327AC9))
              todayBackgroundColor: WidgetStatePropertyAll(Color(0xff327AC9)),
            ),
            timePickerTheme: TimePickerThemeData(
              elevation: 0,
              hourMinuteColor: Color(0xffD3D3D3),
              dialHandColor: Color(0xff327AC9),
              backgroundColor: Color(0xffFFFFFF),
              cancelButtonStyle: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Color(0xff327AC9),
                ),
              ),
              confirmButtonStyle: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Color(0xff327AC9),
                ),
              ),
              dialBackgroundColor: Color(0xffE6E0E9).withOpacity(0.2),
            ),
            appBarTheme: AppBarTheme(
              // backgroundColor: Color(0xffFAFAFA),
              color: Color(0xffFAFAFA),
              surfaceTintColor: Color(0xffFAFAFA),
            ),
            scaffoldBackgroundColor: Color(0xffFAFAFA),
            fontFamily: "Poppin",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
