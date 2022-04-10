import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.horizontal,
    required this.vertical,
    required this.fontSize,
  }) : super(key: key);
  final Callback onPressed;
  final String text;
  final Color color;
  final double horizontal;
  final double vertical;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
      style: ButtonStyle(
        //elevation: ,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        )),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff00BE84),
        ),
      ),
    );
  }
}
