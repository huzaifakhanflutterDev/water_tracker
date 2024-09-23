import 'package:get/get.dart';

class DrinkController extends GetxController{
  var selectedIndex = 0.obs;
  void changeIndex(index){
    selectedIndex.value = index;
  }

}