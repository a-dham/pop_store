import 'package:get/get.dart';
import 'package:pop_store/src/logic/bindings/Auth_bindings.dart';
import 'package:pop_store/src/logic/controller/auth_controller.dart';
import 'package:pop_store/src/view/screens/Auth/Login/login.dart';
import 'package:pop_store/src/view/screens/Auth/forget%20password/forget_password.dart';
import 'package:pop_store/src/view/screens/Auth/sign_up/sign_up.dart';
import 'package:pop_store/src/view/screens/home/home_screen.dart';
import 'package:pop_store/src/view/screens/splash_screen.dart';

class AppRoutes {
//initial route
  static const splashscreen = Routes.splashscreen;

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
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetpassword,
      page: () => ForgetPassword(),
    ),
  ];
}

class Routes {
  static const splashscreen = '/splashscreen';
  static const loginscreen = '/loginscreen';
  static const signup = '/signupscreen';
  static const home = '/homescreen';
  static const forgetpassword = '/forgetpassword';
}