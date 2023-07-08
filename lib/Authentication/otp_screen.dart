import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var utils = AppUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
              Image.asset(
                "assets/donut.png",
                scale: 4,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Got it?",
                style: utils.xxLargeHeadingTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please enter the code sent to your email.",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                showCursor: true,
                length: 6,
              ),
              const SizedBox(
                height: 20,
              ),
              utils.bigButton(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                borderRadius: 10.0,
                containerColor: blueColor,
                onTap: () {
                  Navigator.pushNamed(context, newPasswordScreenRoute);
                },
                text: "Verify",
                fontSize: 18.0,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: blueColor),
    borderRadius: BorderRadius.circular(10),
  ),
);
