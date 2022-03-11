import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/view/screens/favorite/favorites.dart';
import 'package:pop_store/src/view/screens/home/home.dart';
import 'package:pop_store/src/view/screens/home/home_screen.dart';
import 'package:pop_store/src/view/screens/notifacations/notifacations.dart';
import 'package:pop_store/src/view/screens/profile/profile.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  List pages = [
    HomePage(),
    Notifacations(),
    Favorites(),
    Profile(),
  ].obs;
}
