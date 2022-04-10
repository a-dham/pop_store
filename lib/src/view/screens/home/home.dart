// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/all_products_controller.dart';
import 'package:pop_store/src/logic/controller/cart_controller.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_store/src/utils/custom_text_field.dart';
import 'package:pop_store/src/view/widgets/home/categories_widget.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CartController cartController = Get.find<CartController>();
  AllProductsController allProductsController =
      Get.find<AllProductsController>();
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250.h,
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Get.isDarkMode ? Colors.black : kmaincolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pop Shop',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.pink : Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),
                      Obx(
                        () {
                          return Badge(
                            position: BadgePosition.topEnd(top: 0, end: 3),
                            animationDuration:
                                const Duration(milliseconds: 300),
                            animationType: BadgeAnimationType.slide,
                            badgeContent: Text(
                              cartController.totalCartBadges().toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.offNamed(Routes.cartView);
                              },
                              icon: const Icon(
                                Icons.shopping_cart_sharp,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find Your',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.pink : Colors.white,
                            fontSize: 20.sp,
                            letterSpacing: 2,
                          ),
                        ),
                        Row(
                          children: const [],
                        ),
                        SizedBox(
                          height: 6.0.h,
                        ),
                        Text(
                          'INSPIRATION',
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.pink : Colors.white,
                            fontSize: 22.sp,
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GetBuilder<AllProductsController>(
                        builder: (AllProductsController) => CustomTextField(
                          onChanged: (searchName) {
                            allProductsController.search(searchName);
                          },
                          controller:
                              allProductsController.textSearchController,
                          obscure: false,
                          suffixion: allProductsController
                                  .textSearchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    allProductsController.clearSearch();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                )
                              : null,
                          validator: (string) {
                            return null;
                          },
                          label: "what's on your mind?",
                          icon: Icon(
                            Icons.search,
                            color: Get.isDarkMode ? Colors.pink : Colors.black,
                          ),
                          oncomplete: () {},
                        ),
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Get.isDarkMode ? Colors.pink : Colors.white,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    hint: Text(
                      'Select',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.pink : kmaincolor),
                    ),

                    // icon: const Icon(Icons.arrow_downward),
                    // iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : kmaincolor,
                    ),
                    dropdownColor: Get.isDarkMode ? Colors.black : Colors.white,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
