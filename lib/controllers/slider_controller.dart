import 'package:get/get.dart';

class SliderController extends GetxController{
  var selectedIndex = 500.0.obs;

  void onChanges (value){
    selectedIndex.value = value;
  }

}