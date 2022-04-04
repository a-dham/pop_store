import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/services/all_products_services.dart';
import 'package:pop_store/src/view/widgets/home/product_card.dart';

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
    //       .toList()
    //       .obs;
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
    var isExstingIndex =
        favoriteList.indexWhere((element) => element.id == productId);

    if (isExstingIndex >= 0) {
      favoriteList.removeAt(isExstingIndex);
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
}
