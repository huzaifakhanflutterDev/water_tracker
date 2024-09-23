import 'package:get/get.dart';

class MyAnimationController  extends GetxController{
  var progressValue = 0.0.obs;

  void changes (value){
    progressValue.value = value;
  }

}