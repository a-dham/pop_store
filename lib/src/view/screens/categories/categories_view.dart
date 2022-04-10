// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/category_controller.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/view/screens/productDetails/product_details_view.dart';
import 'package:pop_store/src/view/widgets/home/product_card.dart';

import '../../../logic/controller/all_products_controller.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({
    Key? key,
    required this.title,
  }) : super(key: key);
  AllProductsController getxController = Get.find<AllProductsController>();
  CategoryController categoryController = Get.find<CategoryController>();
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.black : kmaincolor,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(child: Obx(() {
              if (categoryController.isCategoryLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  itemCount: categoryController.categoryItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      image: categoryController.categoryItems[index].image,
                      price: categoryController.categoryItems[index].price,
                      rating:
                          categoryController.categoryItems[index].rating.rate,
                      productId: categoryController.categoryItems[index].id,
                      allProductsModel: categoryController.categoryItems[index],
                      ontTap: () {
                        Get.to(() => ProductDetailsView(
                              image:
                                  categoryController.categoryItems[index].image,
                              title:
                                  categoryController.categoryItems[index].title,
                              productId:
                                  categoryController.categoryItems[index].id,
                              rating: categoryController
                                  .categoryItems[index].rating.rate,
                              description: categoryController
                                  .categoryItems[index].description,
                              price:
                                  categoryController.categoryItems[index].price,
                              allProductsModel:
                                  categoryController.categoryItems[index],
                            ));
                      },
                    );
                  },
                );
              }
            })),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
