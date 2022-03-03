import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onpressed,
    required this.text,
    required this.color,
    required this.horizental,
    required this.vertical,
    required this.fontsize,
  }) : super(key: key);
  final Callback onpressed;
  final String text;
  final Color color;
  final double horizental;
  final double vertical;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontsize,
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
          horizontal: horizental,
          vertical: vertical,
        )),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff00BE84),
        ),
      ),
    );
  }
}
