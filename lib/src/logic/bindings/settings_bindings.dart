import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/settings_controller.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}
