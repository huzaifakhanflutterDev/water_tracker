import 'package:get/get.dart';

class ReminderController extends GetxController{
  var selectedIndex = 0.obs;
  void onChanges(int index){
    selectedIndex.value = index;
  }
}