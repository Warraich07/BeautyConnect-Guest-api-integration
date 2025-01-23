import 'package:get/get.dart';

class GeneralControllerr extends GetxController {
  RxInt _currentIndex = 2.obs;
  int get currentIndex => _currentIndex.value;

  void onBottomBarTapped(int index) {
    _currentIndex.value = index;
  }


}
int languageCount=0;