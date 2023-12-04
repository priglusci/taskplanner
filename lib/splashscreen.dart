import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taskplanner/auth/loginnya.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}
class _splashScreenState extends State<splashScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00CA7D),
      body: Center(
        child: Container(
          child: Image.asset("assets/logo-splash.png"),
        )
      ),
    );
  }
}

