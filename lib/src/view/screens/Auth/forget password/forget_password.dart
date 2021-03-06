// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pop_store/src/logic/controller/auth_controller.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/custom_elevated_button.dart';
import 'package:pop_store/src/utils/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  GetxController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Forget Password'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kmaincolor,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
            const Text(
              'If YOU WANT TO RECOVER YOUR ACCOUNT, THEN PLEAS PROVIDE YOUR EMAIL ID BELOW',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.clip,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Image.asset(
                'assets/images/forgetpass.png',
                height: 400,
              ),
            ),
            CustomTextField(
              label: "Email",
              icon: const Icon(
                Icons.email,
                color: kmaincolor,
              ),
              oncomplete: () {},
              suffixion: const Text(''),
              controller: emailController,
              validator: (newValue) {
                return null;
              },
              obscure: false,
              onChanged: (string) {},
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: GetBuilder<AuthController>(
                  builder: (controller) => CustomElevatedButton(
                      onPressed: () {
                        String email = emailController.text.trim();
                        controller.restpassword(
                          email: email,
                        );
                      },
                      text: 'Send',
                      color: kmaincolor,
                      horizontal: 11,
                      vertical: 20,
                      fontSize: 20.sp),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
