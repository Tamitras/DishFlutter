import 'dart:async';
import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var utils = AppUtils();

  @override
  void initState() {
    super.initState();
    splashNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/donut.png",
              scale: 8,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Food \nManagement",
              style: utils.largeTitleBoldTextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  splashNavigator() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, landingScreenRoute, (route) => false);
    });
  }
}
