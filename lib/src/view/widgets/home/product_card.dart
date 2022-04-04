import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:pop_store/src/logic/controller/all_products_controller.dart';
import 'package:pop_store/src/logic/controller/cart_controller.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.image,
    required this.price,
    required this.rating,
    required this.productId,
    required this.allProductsModel,
    required this.ontTap,
  }) : super(key: key);
  String image;
  double price;
  double rating;
  int productId;
  AllProductsModel allProductsModel;
  Callback ontTap;
  AllProductsController controller = Get.find<AllProductsController>();
  CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              offset: Offset.zero,
              spreadRadius: 3.0,
              color: Color(0xffF5F5F5),
            ),
          ],
        ),
        child: Obx(
          (() => InkWell(
                onTap: ontTap,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.favorites(productId);
                          },
                          icon: controller.isFavorite(productId)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                ),
                        ),
                        IconButton(
                          onPressed: () {
                            cartController.addProductToCard(allProductsModel);
                          },
                          icon: const Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5.0, left: 3.0, right: 3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            image,
                            fit: BoxFit.contain,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$ $price'),
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                    ),
                                    Text('$rating'),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: kmaincolor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
