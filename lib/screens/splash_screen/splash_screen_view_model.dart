import 'package:flutter/material.dart';
import 'package:mobile_app/screens/login_screen/login_screen.dart';
import 'package:mobile_app/widgets/route.dart';
import './splash_screen.dart';

abstract class SplashScreenViewModel extends State<SplashScreen> {

  double width = 0.0;
  double height = 0.0;

  splash() async {
    Future.delayed(const Duration(seconds: 3), () {
      nextPageRemove(context, LoginScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    splash();
  }
}
