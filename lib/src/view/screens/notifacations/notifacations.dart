import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifacations extends StatelessWidget {
  const Notifacations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Text('Notifacations page'),
      ),
    );
  }
}
