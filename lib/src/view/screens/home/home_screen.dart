import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/bindings/home_bindings.dart';
import 'package:pop_store/src/logic/controller/home_controller.dart';
import 'package:pop_store/src/logic/controller/theme_mode.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/custom_text_field.dart';

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
                    Icons.notifications,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.notifications,
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
                    Icons.person,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.person,
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
