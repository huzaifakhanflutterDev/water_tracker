import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockController extends GetxController{
  var selectedTime =TimeOfDay.now().obs;

  void  updatedTime (TimeOfDay newTime){
    selectedTime.value = newTime;
  }

}