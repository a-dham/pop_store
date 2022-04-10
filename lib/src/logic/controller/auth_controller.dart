// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pop_store/src/model/facebook_model.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/my_string.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  bool visibility = true;
  bool checkbox = false;
  bool remember = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String username = '';
  FacebookModel? facebookModel;
  bool isSignIn = false;
  final GetStorage authBox = GetStorage();

  void visibilityfun() {
    visibility = !visibility;
    update();
  }

  void checkacceptconditions() {
    checkbox = !checkbox;
    update();
  }

  void remeberme() {
    remember = !remember;
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
      String message = '';
      if (e.code == 'weak-password') {
        message = "The password provided is too weak";
      } else if (e.code == '[firebase_auth/email-already-in-use]') {
        message = 'The account already exists for that email';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kmaincolor,
        animationDuration: const Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: const Duration(milliseconds: 800),
      );
    } catch (e) {
      Get.snackbar(
        "$e",
        "There check this $e",
        backgroundColor: kmaincolor,
        animationDuration: const Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: const Duration(milliseconds: 800),
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
          .then(
        (value) {
          username = auth.currentUser!.displayName!;
        },
      );
      isSignIn = true;
      authBox.write('Auth', isSignIn);
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
        animationDuration: const Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: const Duration(milliseconds: 800),
      );
    } catch (e) {
      Get.snackbar(
        "$e",
        "There check this $e",
        backgroundColor: kmaincolor,
        animationDuration: const Duration(milliseconds: 800),
        colorText: Colors.white,
        duration: const Duration(milliseconds: 800),
      );
    }
  }

  Future restpassword({required email}) async {
    try {
      const Center(child: CircularProgressIndicator());
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.offNamed(Routes.loginScreen);
    } catch (e) {
      String message =
          e.toString().replaceAll(RegExp(validationEmail), ' ').capitalize!;
      Get.snackbar(
        "Sorry",
        "There check this $message",
        backgroundColor: kmaincolor,
        animationDuration: const Duration(milliseconds: 400),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  Future<UserCredential> googlesignin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // GoogleSignIn().currentUser?.displayName;
    // GoogleSignIn().currentUser?.photoUrl;
    isSignIn = true;
    authBox.write('Auth', isSignIn);

    update();
    Get.offNamed(Routes.home);

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    // final LoginResult loginResult = await FacebookAuth.instance.login();
    var data = await FacebookAuth.instance.getUserData();
    facebookModel = FacebookModel.fromjson(data);
    print("=====================");
    print(facebookModel?.email);

    print(facebookModel?.name);
    print(facebookModel?.id);

    print("=====================");
    isSignIn = true;
    authBox.write('Auth', isSignIn);

    update();
    Get.offNamed(Routes.home);
    // Create a credential from the access token
    // final OAuthCredential facebookAuthCredential =
    //     FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void singOut() {
    try {
      auth.signOut();
      FacebookAuth.instance.logOut();
      GoogleSignIn().signOut();
      authBox.write('Auth', isSignIn);
      isSignIn = false;

      update();
      Get.offNamed(Routes.splashScreen);
    } catch (e) {
      print(e);
    }
  }
}
