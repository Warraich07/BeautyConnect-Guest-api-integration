import 'package:get/get.dart';
import 'general_controller.dart';
import 'guest_controller.dart';

class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(GeneralController());
    Get.put(GuestController());


  }
}