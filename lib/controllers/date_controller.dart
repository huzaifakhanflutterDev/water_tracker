import 'package:get/get.dart';

class DateController extends GetxController{
  // Rx<DateTime> today = DateTime.now().obs;
  //
  // void onSelectedDay(DateTime day){
  //   today.value = day;
  // }

  var selectedDays = <DateTime>[].obs;
  
  void onSelectedDay(DateTime day){
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    }  else{
      selectedDays.add(day);
    }
    
  }
  
  
}