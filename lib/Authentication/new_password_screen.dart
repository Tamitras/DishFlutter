import 'package:flutter/material.dart';

import '../Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var newPasswordController = TextEditingController();
  var reEnterNewPasswordController = TextEditingController();
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
                "Set New Password",
                style: utils.xxLargeHeadingTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please fill out the details to continue!",
                style: utils.smallTitleTextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              utils.textField(
                controller: newPasswordController,
                hintText: "New Password",
                isObscure: true,
                prefixIcon: Image.asset(
                  "assets/passwordIcon.png",
                  color: blueColor,
                  scale: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              utils.textField(
                controller: reEnterNewPasswordController,
                hintText: "Re Enter New Password",
                isObscure: true,
                prefixIcon: Image.asset(
                  "assets/passwordIcon.png",
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, loginScreenRoute, (route) => false);
                },
                text: "Continue",
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
