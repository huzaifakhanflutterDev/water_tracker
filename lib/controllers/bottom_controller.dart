import 'package:get/get.dart';

class BottomController extends GetxController {
  var selectedIndex = 0.obs;

  void onSelected(index) {
    selectedIndex.value = index;
  }
}
