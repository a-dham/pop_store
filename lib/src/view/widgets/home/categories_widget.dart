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
        return Center(
          child: CircularProgressIndicator(
            color: kmaincolor,
          ),
        );
      } else {
        return Expanded(
          child: SizedBox(
            //  height: 400,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              itemCount: getxController.allProductList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  image: getxController.allProductList[index].image,
                  price: getxController.allProductList[index].price,
                  rating: getxController.allProductList[index].rating.rate,
                  productId: getxController.allProductList[index].id,
                  allProductsModel: getxController.allProductList[index],
                  ontTap: () {
                    Get.to(() => ProductDetailsView(
                          image: getxController.allProductList[index].image,
                          title: getxController.allProductList[index].title,
                          productId: getxController.allProductList[index].id,
                          rating:
                              getxController.allProductList[index].rating.rate,
                          description:
                              getxController.allProductList[index].description,
                          price: getxController.allProductList[index].price,
                          allProductsModel:
                              getxController.allProductList[index],
                        ));
                  },
                );
              },
            ),
          ),
        );
      }
    });
  }
}
