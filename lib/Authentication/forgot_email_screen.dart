import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class ForgotEmailScreen extends StatefulWidget {
  const ForgotEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotEmailScreen> createState() => _ForgotEmailScreenState();
}

class _ForgotEmailScreenState extends State<ForgotEmailScreen> {
  var emailController = TextEditingController();
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
                "Forgot Password?",
                style: utils.xxLargeHeadingTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "We all do sometimes, let's recover it!",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              utils.textField(
                controller: emailController,
                hintText: "Email",
                isObscure: false,
                prefixIcon: Image.asset(
                  "assets/emailIcon.png",
                  color: blueColor,
                  scale: 18,
                ),
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
                  Navigator.pushNamed(context, otpScreenRoute);
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
