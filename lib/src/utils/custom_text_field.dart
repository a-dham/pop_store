// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:pop_store/src/utils/constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.oncomplete,
    @required this.suffixion,
    required this.controller,
    required this.validator,
    required this.obscure,
    @required this.onChanged,
  }) : super(key: key);
  final String label;
  final Icon icon;
  final Callback oncomplete;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool obscure;
  Widget? suffixion;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black,
      ),
      onChanged: onChanged,
      onEditingComplete: oncomplete,
      controller: controller,
      validator: validator,
      obscureText: obscure,
      cursorColor: kmaincolor,
      enableIMEPersonalizedLearning: true,
      enableInteractiveSelection: true,
      enableSuggestions: true,
      decoration: InputDecoration(
        suffixIcon: suffixion,
        filled: true,
        enabled: true,
        label: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: icon,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: Get.isDarkMode ? Colors.pink : Colors.black,
              ),
            )
          ],
        ),
        labelStyle: const TextStyle(color: Color(0xff707070)),
        fillColor: const Color(0xffF5F5F5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Get.isDarkMode ? Colors.pink : kmaincolor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffF5F5F5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF5F5F5)),
          borderRadius: BorderRadius.circular(10),
        ),
        errorMaxLines: 2,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Get.isDarkMode ? Colors.pink : kmaincolor,
          ),
        ),
      ),
    );
  }
}
