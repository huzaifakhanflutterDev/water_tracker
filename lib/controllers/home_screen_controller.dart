import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;

  changeIndex(value) {
    selectedIndex.value = value;
  }
}
