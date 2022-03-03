import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop_store/src/utils/constant.dart';
import 'package:pop_store/src/utils/custom_text_field.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 200.h,
            padding: EdgeInsets.all(16.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: kmaincolor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'POP SHOP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                Row(
                  children: [
                    // Expanded(
                    // child: CustomTextField(
                    //   lable: "Search you're looking for",
                    //   icon: Icon(Icons.search),
                    //   oncomplete: () {},
                    // ),
                    // ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
