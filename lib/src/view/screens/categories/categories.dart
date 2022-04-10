// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/category_controller.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/view/screens/categories/categories_view.dart';

class Categories extends StatelessWidget {
  Categories({
    Key? key,
  }) : super(key: key);
  CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.black : kmaincolor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_basket_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(child: Obx(() {
            if (categoryController.categoryList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return ListView.separated(
                itemCount: categoryController.categoryList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      categoryController.getCategoryIndex(index);
                      Get.to(CategoriesView(
                        title:
                            categoryController.categoryList[index].capitalize!,
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                      ),
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 10,
                      ),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            categoryController.imagesList[index],
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        categoryController.categoryList[index],
                        style: const TextStyle(
                          fontSize: 20,
                          color: kmaincolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          })),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
