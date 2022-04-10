// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/auth_controller.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/custom_elevated_button.dart';
import 'package:pop_store/src/utils/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_store/src/utils/my_string.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  GlobalKey<FormState> signupformkey = GlobalKey();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  GetxController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Form(
          key: signupformkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 75.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "SIGN ",
                            style: TextStyle(
                              fontSize: 35.sp,
                              color: kmaincolor,
                            ),
                          ),
                          Text(
                            "UP",
                            style: TextStyle(
                              fontSize: 35.sp,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          try {
                            if (!RegExp(validationName).hasMatch(value!)) {
                              return "Your username mustn't have $Value";
                            }
                          } catch (e) {
                            return 'your username has error in $e';
                          }
                          return null;
                        },
                        obscure: false,
                        controller: usernamecontroller,
                        oncomplete: () {},
                        label: 'User Name',
                        icon: Icon(
                          Icons.person,
                          color: kmaincolor,
                          size: 38.sp,
                        ),
                        onChanged: (string) {},
                        suffixion: null,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          try {
                            if (!RegExp(validationEmail).hasMatch(value!)) {
                              return "Your Email mustn't have $Value";
                            }
                          } catch (e) {
                            return 'it should be $e';
                          }
                          return null;
                        },
                        obscure: false,
                        controller: emailcontroller,
                        oncomplete: () {},
                        label: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: kmaincolor,
                          size: 30.sp,
                        ),
                        onChanged: (string) {},
                        suffixion: null,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GetBuilder<AuthController>(
                        builder: (controller) => CustomTextField(
                          validator: (value) {
                            try {
                              if (value!.length < 6) {
                                return "Your password should be bigger than 6 digits";
                              }
                            } catch (e) {
                              return 'it should be this $e';
                            }
                            return null;
                          },
                          obscure: controller.visibility ? true : false,
                          suffixion: IconButton(
                            onPressed: () {
                              controller.visibilityfun();
                            },
                            icon: controller.visibility
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                          ),
                          controller: passwordcontroller,
                          oncomplete: () {},
                          label: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: kmaincolor,
                            size: 30.sp,
                          ),
                          onChanged: (string) {},
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GetBuilder<AuthController>(
                        builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.9.sp,
                              child: Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                splashRadius: 5.sp,
                                fillColor: MaterialStateProperty.all(
                                  const Color(0xffF5F5F5),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide()),
                                value: controller.checkbox,
                                onChanged: (newValue) {
                                  controller.checkacceptconditions();
                                },
                                activeColor: const Color(0xff707070),
                                checkColor: kmaincolor,
                              ),
                            ),
                            Text('I accept ',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color(0xff707070),
                                )),
                            Text(
                              'terms & conditions',
                              style: TextStyle(
                                fontSize: 15.sp,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                color: const Color(0xff707070),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      GetBuilder<AuthController>(
                          builder: (controller) => Row(
                                children: [
                                  Expanded(
                                    child: CustomElevatedButton(
                                      onPressed: () async {
                                        try {
                                          if (signupformkey.currentState!
                                              .validate()) {
                                            String username =
                                                usernamecontroller.text.trim();
                                            String email =
                                                emailcontroller.text.trim();
                                            String password =
                                                passwordcontroller.text;
                                            controller.signupwithFirebase(
                                              username: username,
                                              password: password,
                                              email: email,
                                            );
                                          } else if (controller.checkbox ==
                                              false) {
                                            Get.snackbar(
                                              'PLZ',
                                              'Check True for our conditions',
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: kmaincolor,
                                              animationDuration: const Duration(
                                                  milliseconds: 800),
                                              colorText: Colors.white,
                                              duration: const Duration(
                                                  milliseconds: 800),
                                            );
                                          }
                                        } catch (e) {
                                          Get.snackbar(
                                            "$e",
                                            "check this $e",
                                            backgroundColor: kmaincolor,
                                            animationDuration: const Duration(
                                                milliseconds: 800),
                                            colorText: Colors.white,
                                            duration: const Duration(
                                                milliseconds: 800),
                                          );
                                        }
                                      },
                                      text: 'SIGN UP',
                                      color: kmaincolor,
                                      horizontal: 20.w,
                                      vertical: 16.h,
                                      fontSize: 16.sp,
                                    ),
                                  )
                                ],
                              ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                Container(
                  height: 100.h,
                  decoration: const BoxDecoration(
                    color: kmaincolor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account? ",
                        style: TextStyle(
                          color:
                              Get.isDarkMode ? Colors.pinkAccent : Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(
                            Routes.loginScreen,
                          );
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
