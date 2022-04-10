// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/view/screens/productDetails/product_details_view.dart';
import 'package:pop_store/src/view/widgets/home/product_card.dart';

import '../../../logic/controller/all_products_controller.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({
    Key? key,
  }) : super(key: key);
  AllProductsController getxController = Get.find<AllProductsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (getxController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: kmaincolor,
          ),
        );
      } else {
        return Expanded(
          child: SizedBox(
            //  height: 400,
            width: double.infinity,
            child: getxController.searchList.isEmpty &&
                    getxController.textSearchController.text.isNotEmpty
                ? Get.isDarkMode
                    ? Image.asset('assets/images/search_empty_light.png')
                    : Image.asset('assets/images/search_empty_light.png')
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    itemCount: getxController.searchList.isEmpty
                        ? getxController.allProductList.length
                        : getxController.searchList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (getxController.searchList.isEmpty) {
                        return ProductCard(
                          image: getxController.allProductList[index].image,
                          price: getxController.allProductList[index].price,
                          rating:
                              getxController.allProductList[index].rating.rate,
                          productId: getxController.allProductList[index].id,
                          allProductsModel:
                              getxController.allProductList[index],
                          ontTap: () {
                            Get.to(() => ProductDetailsView(
                                  image: getxController
                                      .allProductList[index].image,
                                  title: getxController
                                      .allProductList[index].title,
                                  productId:
                                      getxController.allProductList[index].id,
                                  rating: getxController
                                      .allProductList[index].rating.rate,
                                  description: getxController
                                      .allProductList[index].description,
                                  price: getxController
                                      .allProductList[index].price,
                                  allProductsModel:
                                      getxController.allProductList[index],
                                ));
                          },
                        );
                      } else {
                        return ProductCard(
                          image: getxController.searchList[index].image,
                          price: getxController.searchList[index].price,
                          rating: getxController.searchList[index].rating.rate,
                          productId: getxController.searchList[index].id,
                          allProductsModel: getxController.searchList[index],
                          ontTap: () {
                            Get.to(() => ProductDetailsView(
                                  image: getxController.searchList[index].image,
                                  title: getxController.searchList[index].title,
                                  productId:
                                      getxController.searchList[index].id,
                                  rating: getxController
                                      .searchList[index].rating.rate,
                                  description: getxController
                                      .searchList[index].description,
                                  price: getxController.searchList[index].price,
                                  allProductsModel:
                                      getxController.searchList[index],
                                ));
                          },
                        );
                      }
                    },
                  ),
          ),
        );
      }
    });
  }
}
