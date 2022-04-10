// ignore_for_file: must_be_immutable

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:pop_store/src/logic/controller/all_products_controller.dart';
import 'package:pop_store/src/logic/controller/cart_controller.dart';
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsBody extends StatefulWidget {
  final String image;
  final String title;
  final int productId;
  final double rating;
  final String description;
  final double price;
  final AllProductsModel allProductsModel;
  const ProductDetailsBody({
    required this.image,
    required this.title,
    required this.productId,
    required this.rating,
    required this.description,
    required this.price,
    required this.allProductsModel,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

CartController cartController = Get.find<CartController>();
PageController pageController = PageController();
CarouselController carouselController = CarouselController();
int currentIndex = 0;
int currentColor = 0;
List<Color> productColor = [
  kCOlor1,
  kCOlor2,
  kCOlor3,
  kCOlor4,
  kCOlor5,
];

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: 5,
                    options: CarouselOptions(
                      height: double.infinity,
                      initialPage: 0,
                      reverse: false,
                      viewportFraction: 0.9,
                      onPageChanged: (index, _) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                    itemBuilder: (ctx, currentIndex, realIdx) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 150,
                    right: 150,
                    bottom: 30,
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: 5,
                      effect: ExpandingDotsEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: kmaincolor,
                        dotColor: Get.isDarkMode ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 30,
                    child: Container(
                      height: 160,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: ListView.separated(
                        itemCount: productColor.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 4,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ColorPicker(
                            outerBorder: currentColor == index,
                            color: productColor[index],
                            onTap: () {
                              setState(() {
                                currentColor = index;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: kmaincolor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.offNamed(Routes.home);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Obx(
                          () => Badge(
                            position: BadgePosition.topEnd(top: -5, end: -5),
                            animationDuration:
                                const Duration(milliseconds: 300),
                            animationType: BadgeAnimationType.slide,
                            badgeContent: Text(
                              cartController.totalCartBadges().toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: kmaincolor,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.offNamed(Routes.cartView);
                                },
                                icon: const Icon(
                                  Icons.shopping_basket_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ProductInfo(
              title: widget.title,
              productId: widget.productId,
              rating: widget.rating,
              description: widget.description,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizeOfProduct(),
            const SizedBox(
              height: 30,
            ),
            AddToCard(
              price: widget.price,
              allProductsModel: widget.allProductsModel,
            )
          ],
        ),
      ),
    );
  }
}

class AddToCard extends StatelessWidget {
  AddToCard({
    Key? key,
    required this.price,
    required this.allProductsModel,
  }) : super(key: key);
  CartController cartController = Get.find<CartController>();
  AllProductsModel allProductsModel;

  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              Text(
                '\$ $price',
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
              onPressed: () {
                cartController.addProductToCard(allProductsModel);
              },
              label: const Text('Add To Cart'),
              icon: const Icon(Icons.shopping_cart_sharp),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                primary: kmaincolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SizeOfProduct extends StatefulWidget {
  const SizeOfProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<SizeOfProduct> createState() => _SizeOfProductState();
}

class _SizeOfProductState extends State<SizeOfProduct> {
  List<String> sizeProductList = ['S', 'M', 'L', 'XL', 'XXL'];

  int currentSize = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10),
      height: 40,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sizeProductList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentSize = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              color: Get.isDarkMode
                  ? currentSize == index
                      ? kmaincolor.withOpacity(0.5)
                      : Colors.black
                  : currentSize == index
                      ? kmaincolor.withOpacity(0.5)
                      : Colors.white,
              height: 50,
              width: 45,
              child: Text(
                sizeProductList[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  ProductInfo({
    Key? key,
    required this.title,
    required this.productId,
    required this.rating,
    required this.description,
  }) : super(key: key);
  final String title;
  final int productId;
  final double rating;
  final String description;
  AllProductsController controller = Get.find<AllProductsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: IconButton(
                  onPressed: () {
                    controller.favorites(productId);
                  },
                  icon: controller.isFavorite(productId)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                        ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '$rating',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              RatingBar.builder(
                initialRating: rating,
                allowHalfRating: true,
                minRating: 1,
                updateOnDrag: true,
                onRatingUpdate: (rating) {
                  rating = rating;
                },
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                unratedColor: Colors.amber.withAlpha(50),
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            description,
            trimLines: 3,

            // lessStyle: TextStyle(fontSize: 20),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  ColorPicker({
    Key? key,
    required this.outerBorder,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  bool outerBorder;
  Color color;
  Callback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: outerBorder ? Border.all(color: color, width: 4) : null,
        ),
        child: Container(
          height: 35,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
