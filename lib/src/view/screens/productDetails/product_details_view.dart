// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/view/screens/productDetails/product_details_body.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({
    required this.image,
    required this.title,
    required this.productId,
    required this.rating,
    required this.description,
    required this.price,
    required this.allProductsModel,
    Key? key,
  }) : super(key: key);
  String image;
  final String title;
  final int productId;
  final double rating;
  final String description;
  final double price;
  final AllProductsModel allProductsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ProductDetailsBody(
        image: image,
        title: title,
        productId: productId,
        rating: rating,
        description: description,
        price: price,
        allProductsModel: allProductsModel,
      ),
    );
  }
}
