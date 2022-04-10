// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/all_products_controller.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';

class Favorites extends StatelessWidget {
  Favorites({
    Key? key,
  }) : super(key: key);
  AllProductsController controller =
      Get.put<AllProductsController>(AllProductsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 15,
              ),
            ),
            title: const Text('Favorites'),
            centerTitle: false,
            backgroundColor: Get.isDarkMode ? Colors.black : kmaincolor,
            actions: [
              IconButton(
                onPressed: () {
                  Get.offNamed(Routes.cartView);
                },
                icon: const Icon(
                  Icons.shopping_basket,
                ),
              ),
            ],
            elevation: 0,
          ),
          body: Obx(() {
            if (controller.favoriteList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset(
                        'assets/images/heart.png',
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('There is no Favorite'),
                        Icon(Icons.heart_broken),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(
                  right: 1.0,
                  left: 8.0,
                  top: 20,
                ),
                child: ListView.separated(
                  itemCount: controller.favoriteList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 2,
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return favoriteCard(
                      title: controller.favoriteList[index].title,
                      price: controller.favoriteList[index].price,
                      image: controller.favoriteList[index].image,
                      productId: controller.favoriteList[index].id,
                    );
                  },
                ),
              );
            }
          })),
    );
  }

  Widget favoriteCard({
    required String title,
    required double price,
    required String image,
    required int productId,
  }) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 100,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ $price',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {
              controller.favorites(productId);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
