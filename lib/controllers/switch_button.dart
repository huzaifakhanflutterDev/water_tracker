import 'package:get/get.dart';

class SwitchController extends GetxController{
  var selectedSwitch = false.obs;
  var selectedSwitch2 = false.obs;

  void switched(index){
    selectedSwitch.value = !selectedSwitch.value;
  }
  void switched2(index){
    selectedSwitch2.value = !selectedSwitch2.value;
  }

}