import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/all_products_controller.dart';
import 'package:pop_store/src/logic/controller/cart_controller.dart';

class AllProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AllProductsController());
    Get.lazyPut(() => CartController());
  }
}
