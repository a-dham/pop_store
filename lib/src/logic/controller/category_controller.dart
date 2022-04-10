// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/services/categories_services.dart';

class CategoryController extends GetxController {
  RxList<String> categoryList = <String>[].obs;
  RxBool isCategoryIsLoading = false.obs;
  RxList<String> imagesList = <String>[
    'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
    'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg'
  ].obs;
  @override
  void onInit() {
    super.onInit();

    getCategory();
  }

  getCategory() async {
    List<String> categoryName = await CategoriesServices().getCategories();

    try {
      isCategoryIsLoading(true);
      if (categoryName.isNotEmpty) {
        categoryList.addAll(categoryName);
      }
    } finally {
      isCategoryIsLoading(false);
    }
  }

  RxList<AllProductsModel> categoryItems = <AllProductsModel>[].obs;
  RxBool isCategoryLoading = false.obs;
  getCategoryItems(String categoryName) async {
    isCategoryLoading.value = true;
    categoryItems.value =
        await CategoriesServices().getCategoryItems(categoryName);
    isCategoryLoading.value = false;
  }

  getCategoryIndex(int index) async {
    var categoryName = await getCategoryItems(categoryList[index]);
    if (categoryName != null) {
      categoryItems.value = categoryName;
    }
  }
}
