// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/auth_controller.dart';
import 'package:pop_store/src/logic/controller/settings_controller.dart';
import 'package:pop_store/src/logic/controller/theme_mode.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';

class Settings extends StatelessWidget {
  Settings({
    Key? key,
  }) : super(key: key);
  // bool value;
  var settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? Colors.black : kmaincolor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.nightlight,
              color: Get.isDarkMode ? Colors.pink : Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        //   controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Profile(),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'General',
                style: TextStyle(
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.pink : kmaincolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const DarkModeWidget(),
            const SizedBox(
              height: 10,
            ),
            const LogOutWidget(),
            const SizedBox(
              height: 10,
            ),
            const LanguageWidget(),
          ],
        ),
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: languageSettings,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.language_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Language',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Expanded(
            child: SizedBox(
              width: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: '!',
          titleStyle: const TextStyle(
            fontSize: 40,
          ),
          textCancel: 'NO',
          textConfirm: 'YES',
          radius: 100,
          cancelTextColor: Colors.white,
          confirmTextColor: Colors.white,
          backgroundColor: Get.isDarkMode ? Colors.grey : kmaincolor,
          buttonColor: Colors.red,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            Get.offNamed(Routes.splashScreen);
            AuthController().singOut();
          },
          middleText: "Are You Sure?",
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: logOutSettings,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'LogOut',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (settingController) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: darkSettings,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.dark_mode_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Dark Mode',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Expanded(
              child: SizedBox(
                width: 10,
              ),
            ),
            Switch(
              activeColor: Colors.pink,
              activeTrackColor: Colors.pink,
              inactiveTrackColor: kmaincolor,
              inactiveThumbColor: kmaincolor,
              value: settingController.switchingValue,
              onChanged: (newValue) {
                Themes().getThemeMode();
                settingController.switchingValue = newValue;
              },
            ),
          ],
        ),
      );
    });
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    'https://media.istockphoto.com/photos/smiling-mixed-race-mature-man-on-grey-background-picture-id1319763895?s=612x612',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Adham Elsharkawy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text('eelsharkawya@gmail.com'),
            ],
          ),
        ],
      ),
    );
  }
}
