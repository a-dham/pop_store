import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
