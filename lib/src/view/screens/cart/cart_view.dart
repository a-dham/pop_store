// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pop_store/src/logic/controller/cart_controller.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black : kmaincolor,
        title: const Text('Text Items'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(Routes.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        actions: [
          Visibility(
            visible: cartController.productsMap.isEmpty ? false : true,
            child: IconButton(
              onPressed: () {
                cartController.clearCart();
              },
              icon: const Icon(
                Icons.close_rounded,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          if (cartController.productsMap.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_sharp,
                    size: 130,
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your Cart is',
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                        const TextSpan(
                          text: ' Empty',
                          style: TextStyle(
                            color: kmaincolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Add items to get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Get.offNamed(Routes.home);
                      },
                      label: const Text('Go to Home'),
                      icon: const Icon(Icons.home_filled),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 50,
                        ),
                        primary: kmaincolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      )),
                ],
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartController.productsMap.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 2,
                          color: Colors.grey,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CartProductWidget(
                          quantity:
                              cartController.productsMap.values.toList()[index],
                          allProductsModel:
                              cartController.productsMap.keys.toList()[index],
                          cartController: cartController,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '\$ ${cartController.totalOfCart}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            label: const Text('Check Out'),
                            icon: const Icon(Icons.shopping_cart_sharp),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              primary:
                                  Get.isDarkMode ? Colors.pink : kmaincolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({
    Key? key,
    required this.allProductsModel,
    required this.quantity,
    required this.cartController,
    required this.index,
  }) : super(key: key);
  final AllProductsModel allProductsModel;
  final int quantity;
  final CartController cartController;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:
            Get.isDarkMode ? Colors.pink : Colors.blueAccent.withOpacity(0.5),
      ),
      height: 120,
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                allProductsModel.image,
                fit: BoxFit.fitHeight,
                height: 100,
                width: 80,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allProductsModel.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${allProductsModel.price * quantity}',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.reduceCountOfProduct(allProductsModel);
                    },
                    icon: const Icon(
                      Icons.remove_circle_sharp,
                      size: 28,
                    ),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.addProductToCard(allProductsModel);
                    },
                    icon: const Icon(
                      Icons.add_circle_sharp,
                      size: 28,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  cartController.removeOneProduct(allProductsModel);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
