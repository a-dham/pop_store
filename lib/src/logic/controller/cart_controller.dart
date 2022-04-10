import 'package:get/get.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;
  void addProductToCard(AllProductsModel allProductsModel) {
    if (productsMap.containsKey(allProductsModel)) {
      productsMap[allProductsModel] += 1;
    } else {
      productsMap[allProductsModel] = 1;
    }
  }

  // bool isAddProduct() {

  // }
  // get products => productsMap;
  get totalOfCart => productsMap.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  // get subTotal => productsMap.entries
  //     .map((product) => product.key.price * product.value)
  //     .toList();

  void reduceCountOfProduct(AllProductsModel allProductsModel) {
    if (productsMap.containsKey(allProductsModel) &&
        productsMap[allProductsModel] == 1) {
      productsMap.removeWhere((key, value) => key == allProductsModel);
    } else {
      productsMap[allProductsModel] -= 1;
    }
  }

  void removeOneProduct(AllProductsModel allProductsModel) {
    productsMap.removeWhere((key, value) => key == allProductsModel);
  }

  void clearCart() {
    //we can show Get.defaultDialog before clear cart to confirm user action
    productsMap.clear();
  }

  int totalCartBadges() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
