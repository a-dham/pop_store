import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';

class AuthController extends GetxController {
  bool visibilaty = true;
  bool chekbox = false;
  bool isremember = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String username = '';

  void visibilityfun() {
    visibilaty = !visibilaty;
    update();
  }

  void checkacceptconditions() {
    chekbox = !chekbox;
    update();
  }

  void remeberme() {
    isremember = !isremember;
    update();
  }

  void signupwithFirebase({
    required String username,
    required String password,
    required String email,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        username = username;
        auth.currentUser!.updateDisplayName(username);
      });
      update();
      Get.offNamed(
        Routes.home,
      );
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String meesege = '';
      if (e.code == 'weak-password') {
        meesege = "The password provided is too weak";
      } else if (e.code == '[firebase_auth/email-already-in-use]') {
        meesege = 'The account already exists for that email';
      } else {
        meesege = e.message.toString();
      }
      Get.snackbar(
        title,
        meesege,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kmaincolor,
        animationDuration: Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: Duration(milliseconds: 800),
      );
    } catch (e) {
      Get.snackbar(
        "$e",
        "There check this $e",
        backgroundColor: kmaincolor,
        animationDuration: Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: Duration(milliseconds: 800),
      );
    }
  }

  void signinwithfirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        username = auth.currentUser!.displayName!;
      });
      update();
      Get.offNamed(Routes.home);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        animationDuration: Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: Duration(milliseconds: 800),
      );
    } catch (e) {
      Get.snackbar(
        "$e",
        "There check this $e",
        backgroundColor: kmaincolor,
        animationDuration: Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: Duration(milliseconds: 800),
      );
    }
  }

  void restpassword({required email}) async {
    try {
      Center(child: CircularProgressIndicator());
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.offNamed(Routes.loginscreen);
    } catch (e) {
      Get.snackbar(
        "${e.toString()}",
        "There check this ${e}",
        backgroundColor: kmaincolor,
        animationDuration: Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: Duration(milliseconds: 800),
      );
    }
  }
}
