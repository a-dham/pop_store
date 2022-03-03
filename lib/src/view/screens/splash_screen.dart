import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_store/src/routes/routes.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/custom_elevated_button.dart';

class SplashScreen extends StatelessWidget {
  // static String route_ = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/background.png'),
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(30),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff1C1C1C).withOpacity(0.6),
                  ),
                  child: Text(
                    'Welcome',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffFFFFFF),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 300.w,
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(30),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff1C1C1C).withOpacity(0.6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ElPOP',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff00BE84),
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'SHOP',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffFFFFFF),
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 280.h,
                ),
                CustomElevatedButton(
                  onpressed: () => Get.offNamed(Routes.loginscreen),
                  text: 'Get started',
                  color: kmaincolor,
                  fontsize: 20.sp,
                  horizental: ScreenUtil().setWidth(45),
                  vertical: ScreenUtil().setHeight(15),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(Routes.signup);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.9,
                          fontSize: 20.sp,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
