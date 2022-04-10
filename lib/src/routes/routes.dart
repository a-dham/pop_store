import 'package:get/get.dart';
import 'package:pop_store/src/logic/bindings/Auth_bindings.dart';
import 'package:pop_store/src/logic/bindings/all_products_bindings.dart';
import 'package:pop_store/src/logic/bindings/home_bindings.dart';
import 'package:pop_store/src/logic/bindings/settings_bindings.dart';
import 'package:pop_store/src/view/screens/Auth/Login/login.dart';
import 'package:pop_store/src/view/screens/Auth/forget%20password/forget_password.dart';
import 'package:pop_store/src/view/screens/Auth/sign_up/sign_up.dart';
import 'package:pop_store/src/view/screens/cart/cart_view.dart';
import 'package:pop_store/src/view/screens/categories/categories.dart';
import 'package:pop_store/src/view/screens/favorite/favorites.dart';
import 'package:pop_store/src/view/screens/home/home.dart';
import 'package:pop_store/src/view/screens/home/home_screen.dart';
import 'package:pop_store/src/view/screens/settings/settings_view.dart';
import 'package:pop_store/src/view/screens/splash_screen.dart';

class AppRoutes {
//initial route
  static const splashScreen = Routes.splashScreen;
  static const homeScreen = Routes.home;

  //get page list
  static List<GetPage> routes = [
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUp(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => Home(),
      binding: HomeBindings(),
      bindings: [
        HomeBindings(),
        AuthBinding(),
        AllProductsBindings(),
      ],
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => ForgetPassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => Settings(),
      bindings: [
        AuthBinding(),
        SettingsBindings(),
      ],
    ),
    GetPage(
      name: Routes.category,
      page: () => Categories(),
      bindings: [
        AuthBinding(),
        AllProductsBindings(),
      ],
    ),
    GetPage(name: Routes.favorite, page: () => Favorites(), bindings: [
      AuthBinding(),
      AllProductsBindings(),
    ]),
    GetPage(
      name: Routes.homepage,
      page: () => const HomePage(),
      bindings: [
        AuthBinding(),
        HomeBindings(),
        AllProductsBindings(),
      ],
    ),
    GetPage(
      name: Routes.cartView,
      page: () => CartView(),
      bindings: [
        HomeBindings(),
        AllProductsBindings(),
      ],
    )
  ];
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const signUp = '/signUpScreen';
  static const home = '/homeScreen';
  static const forgetPassword = '/forgetPassword';
  static const settings = '/settings';
  static const category = '/category';
  static const favorite = '/favorite';
  static const homepage = '/homepage';
  static const cartView = '/cartView';
}
