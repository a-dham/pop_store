import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/services/all_products_services.dart';

class AllProductsController extends GetxController {
  List<AllProductsModel> allProductList = <AllProductsModel>[].obs;
  List<AllProductsModel> favoriteList = <AllProductsModel>[].obs;
  RxBool isLoading = true.obs;
  GetStorage favoriteBox = GetStorage();
  @override
  void onInit() {
    super.onInit();
    getAllProducts();

    //store favorite///////
    // if (favoriteBox.read('Auth') != null) {
    //   favoriteList = favoriteBox
    //       .read('Auth')((e) => AllProductsModel.fromJson(e))
    //       .toList();
    // }
  }

  void getAllProducts() async {
    List<AllProductsModel> allProducts =
        await AllProductsServices().getAllProducts();
    try {
      isLoading(true);
      if (allProducts.isNotEmpty) {
        allProductList.addAll(allProducts);
      }
    } finally {
      isLoading(false);
    }
  }

  //logic for add favorites.
  void favorites(int productId) async {
    var isExistingIndex =
        favoriteList.indexWhere((element) => element.id == productId);

    if (isExistingIndex >= 0) {
      favoriteList.removeAt(isExistingIndex);
      await favoriteBox.remove('Auth');
    } else {
      favoriteList
          .add(allProductList.firstWhere((element) => element.id == productId));
      await favoriteBox.write('FAV', favoriteList);
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  //logic for  searchList
  RxList<AllProductsModel> searchList = <AllProductsModel>[].obs;
  TextEditingController textSearchController = TextEditingController();
  void search(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = allProductList.where((search) {
      String searchTitle = search.title.toLowerCase();
      String searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    textSearchController.clear();
    search('');
    update();
  }
}
