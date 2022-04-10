import 'package:get/get.dart';
import 'package:pop_store/src/view/screens/categories/categories.dart';
import 'package:pop_store/src/view/screens/favorite/favorites.dart';
import 'package:pop_store/src/view/screens/home/home.dart';
import 'package:pop_store/src/view/screens/settings/settings_view.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  List pages = [
    const HomePage(),
    Categories(),
    Favorites(),
    Settings(),
  ].obs;
}
