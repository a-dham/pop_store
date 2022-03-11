import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/bindings/home_bindings.dart';
import 'package:pop_store/src/logic/controller/home_controller.dart';
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
            bottomNavigationBar: BottomNavigationBar(
              elevation: 3,
              currentIndex: controller.index.value,
              onTap: (index) {
                controller.index.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.home,
                    color: kmaincolor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.notifications,
                    color: kmaincolor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.favorite,
                    color: kmaincolor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.person,
                    color: kmaincolor,
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
