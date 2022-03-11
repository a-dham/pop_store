import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/auth_controller.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/custom_elevated_button.dart';
import 'package:pop_store/src/utils/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_store/src/utils/my_string.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> logininformkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GetxController getxController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: logininformkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 75.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80.h, right: 30.w, left: 30.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "LOG ",
                            style: TextStyle(
                              fontSize: 35.sp,
                              color: kmaincolor,
                            ),
                          ),
                          Text(
                            "IN",
                            style: TextStyle(
                              fontSize: 35.sp,
                              color: Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      GetBuilder<AuthController>(
                        builder: (getxController) => CustomTextField(
                          obscure: false,
                          validator: (value) {
                            try {
                              if (!RegExp(validationEmail).hasMatch(value!)) {
                                bool newvalue =
                                    !RegExp(validationEmail).hasMatch(value);
                                return "Your Email musn't have ${newvalue}";
                              }
                            } catch (e) {
                              return 'it should be $e';
                            }
                          },
                          controller: emailcontroller,
                          oncomplete: () {},
                          lable: 'Email',
                          icon: Icon(
                            Icons.email,
                            color: kmaincolor,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GetBuilder<AuthController>(
                        builder: (getxController) => CustomTextField(
                          validator: (value) {
                            if (value!.length <= 6) {
                              return 'Password must be at least 8 char';
                            }
                          },
                          suffixicon: IconButton(
                            onPressed: () {
                              getxController.visibilityfun();
                            },
                            icon: getxController.visibilaty
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                          ),
                          controller: passwordcontroller,
                          oncomplete: () {},
                          obscure: getxController.visibilaty ? true : false,
                          lable: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: kmaincolor,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.offNamed(
                              Routes.forgetpassword,
                            );
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontSize: 15.sp,
                              //  fontWeight: FontWeight.w300,
                              color: const Color(0xff707070),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                              scale: 1.9.sp,
                              child: GetBuilder<AuthController>(
                                builder: (getxController) => Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  splashRadius: 5.sp,
                                  fillColor: MaterialStateProperty.all(
                                    const Color(0xffF5F5F5),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide()),
                                  value:
                                      getxController.isremember ? true : false,
                                  onChanged: (newvalue) {
                                    getxController.remeberme();
                                  },
                                  activeColor: const Color(0xff707070),
                                  checkColor: kmaincolor,
                                ),
                              )),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 15.sp,
                              // fontWeight: FontWeight.w300,
                              color: Color(0xff707070),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GetBuilder<AuthController>(
                              builder: (getxController) => CustomElevatedButton(
                                onpressed: () {
                                  try {
                                    if (logininformkey.currentState!
                                        .validate()) {
                                      String email =
                                          emailcontroller.text.trim();
                                      String password = passwordcontroller.text;
                                      getxController.signinwithfirebase(
                                          email: email, password: password);
                                    }
                                  } catch (e) {
                                    Get.snackbar(
                                      "$e",
                                      "check this $e",
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: kmaincolor,
                                      animationDuration:
                                          Duration(milliseconds: 800),
                                      colorText: Colors.white,
                                      duration: Duration(milliseconds: 800),
                                    );
                                  }
                                },
                                text: 'LOG IN',
                                color: kmaincolor,
                                horizental: 20.w,
                                vertical: 12.h,
                                fontsize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 16.sp,
                          // fontWeight: FontWeight.w300,
                          color: Color(0xff707070),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      GetBuilder<AuthController>(
                        builder: (getxController) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                getxController.signInWithFacebook();
                              },
                              child: Image.asset(
                                'assets/images/facebook.png',
                                height: 50.h,
                                width: 30.w,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            InkWell(
                              onTap: () {
                                try {
                                  getxController.googlesignin();
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 50.h,
                                width: 30.w,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 90.h,
                ),
                Container(
                  height: 95.h,
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
                        "Don't have an Account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(
                            Routes.signup,
                          );
                        },
                        child: Text(
                          'Sign up',
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
