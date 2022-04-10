// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/home_controller.dart';
import 'package:pop_store/src/utils/constant.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  // GetxController getxController = Get.find<HomeController>();
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(
      () {
        return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: Get.isDarkMode ? Colors.black : kmaincolor,
            //   actions: [
            //     IconButton(
            //         onPressed: () {
            //           // Get.changeTheme(Get.isDarkMode
            //           // ? ThemeData.light()
            //           //     : ThemeData.dark());
            //           Themes().getThemeMode();
            //         },
            //         icon: Icon(Icons.settings))
            //   ],
            // ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 3,
              currentIndex: controller.index.value,
              backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
              onTap: (index) {
                controller.index.value = index;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.pink : kmaincolor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_rounded,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.category_rounded,
                    color: Get.isDarkMode ? Colors.pink : kmaincolor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.pink : kmaincolor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.pink : kmaincolor,
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: controller.index.value,
              children: [...controller.pages],
            ));
      },
    ));
  }
}
