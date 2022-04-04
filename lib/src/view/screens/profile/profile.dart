import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/auth_controller.dart';
import 'package:pop_store/src/logic/controller/home_controller.dart';
import 'package:pop_store/src/logic/controller/theme_mode.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/custom_elevated_button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text('MY PROFILE'),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.black : kmaincolor,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Themes().getThemeMode();
                });
              },
              icon: Icon(
                Icons.nightlight,
                color: Get.isDarkMode ? Colors.pink : Colors.white,
              ),
            )
          ],
        ),
        body: Center(
          child: CustomElevatedButton(
              onpressed: () {
                setState(() {
                  Get.defaultDialog(
                    title: '!',
                    titleStyle: TextStyle(
                      fontSize: 30,
                    ),
                    // cancel: Text(),
                    // confirm: Text(),
                    textCancel: 'NO',
                    textConfirm: 'YES',
                    radius: 100,
                    cancelTextColor: Colors.white,
                    confirmTextColor: Colors.white,
                    backgroundColor: Get.isDarkMode ? Colors.grey : kmaincolor,
                    buttonColor: Colors.red,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      Get.offNamed(Routes.splashscreen);
                      AuthController().singOut();
                    },
                    middleText: "Are You Sure You Wan't to LogOut ??",
                  );
                });
              },
              text: 'Logout',
              color: Get.isDarkMode ? Colors.black : kmaincolor,
              horizental: 100,
              vertical: 30,
              fontsize: 20),
        ),
      ),
    );
  }
}
