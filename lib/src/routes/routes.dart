import 'package:get/get.dart';
import 'package:pop_store/src/logic/bindings/Auth_bindings.dart';
import 'package:pop_store/src/logic/bindings/all_products_bindings.dart';
import 'package:pop_store/src/logic/bindings/home_bindings.dart';
import 'package:pop_store/src/logic/controller/all_products_controller.dart';
import 'package:pop_store/src/logic/controller/auth_controller.dart';
import 'package:pop_store/src/view/screens/Auth/Login/login.dart';
import 'package:pop_store/src/view/screens/Auth/forget%20password/forget_password.dart';
import 'package:pop_store/src/view/screens/Auth/sign_up/sign_up.dart';
import 'package:pop_store/src/view/screens/cart/cart_view.dart';
import 'package:pop_store/src/view/screens/favorite/favorites.dart';
import 'package:pop_store/src/view/screens/home/home.dart';
import 'package:pop_store/src/view/screens/home/home_screen.dart';
import 'package:pop_store/src/view/screens/notifacations/notifacations.dart';
import 'package:pop_store/src/view/screens/profile/profile.dart';
import 'package:pop_store/src/view/screens/splash_screen.dart';

class AppRoutes {
//initial route
  static const splashscreen = Routes.splashscreen;
  static const homeScreen = Routes.home;

  //get page list
  static List<GetPage> routes = [
    GetPage(name: Routes.splashscreen, page: () => const SplashScreen()),
    GetPage(
      name: Routes.loginscreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signup,
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
      name: Routes.forgetpassword,
      page: () => ForgetPassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => Profile(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.Notifacation,
      page: () => Notifacations(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.favourite, page: () => Favorites(), bindings: [
      AuthBinding(),
      AllProductsBindings(),
    ]),
    GetPage(
      name: Routes.homepage,
      page: () => HomePage(),
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
  static const splashscreen = '/splashscreen';
  static const loginscreen = '/loginscreen';
  static const signup = '/signupscreen';
  static const home = '/homescreen';
  static const forgetpassword = '/forgetpassword';
  static const profile = '/profile';
  static const Notifacation = '/notifications';
  static const favourite = '/favourite';
  static const homepage = '/homepage';
  static const cartView = '/cartView';
}
