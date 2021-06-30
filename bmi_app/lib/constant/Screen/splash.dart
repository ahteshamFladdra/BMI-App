import 'dart:async';

import 'package:bmi_app/constant/Screen/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      });
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image(
            width: 200,
            height: 200,
            image: AssetImage("assets/bmi.png"),
          ),
        ),
      ),
    );
  }
}
