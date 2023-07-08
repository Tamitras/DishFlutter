import 'package:flutter/material.dart';
import 'package:food_manager/Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var utils = AppUtils();
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 330,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/backgroundimage.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                          ),
                          Text(
                            "My Profile",
                            style: utils.mediumTitleBoldTextStyle(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 190,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/dp.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 80,
                          child: GestureDetector(
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: blueColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Erik Kaufmann",
                      style: utils.largeTitleBoldTextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/emailIcon.png",
                          scale: 20,
                          color: Colors.white,
                        ),
                        Text(
                          "erik.kaufmann91@gmail.com",
                          style: utils.smallTitleTextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/clock.png",
                          scale: 20,
                          color: Colors.white,
                        ),
                        Text(
                          "Joined 5 February, 2023",
                          style: utils.smallTitleTextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    utils.bigButton(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      borderRadius: 10.0,
                      containerColor: blueColor,
                      onTap: () {
                        logoutDialogBox();
                      },
                      text: "Logout",
                      fontSize: 18.0,
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    utils.bigButton(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      borderRadius: 10.0,
                      containerColor: Colors.red,
                      onTap: () {
                        deleteAccountDialogBox();
                      },
                      text: "Delete Account",
                      fontSize: 18.0,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  logoutDialogBox() {
    showGeneralDialog(
      context: context,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 20),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.white60.withOpacity(0.3),
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 190,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                        color: blueColor,
                      ),
                      child: Center(
                        child: Text("Log Out?",
                            style: utils.mediumTitleBoldTextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Are you sure you want to logout?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Decline",
                                  style: utils.smallTitleBoldTextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: Colors.grey[300],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, loginScreenRoute, (route) => false);
                            },
                            child: Container(
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Logout",
                                  style: utils.smallTitleBoldTextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  deleteAccountDialogBox() {
    showGeneralDialog(
      context: context,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 20),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.white60.withOpacity(0.3),
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 210,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text("Delete Account?",
                            style: utils.mediumTitleBoldTextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Are you sure you want to \ndelete your account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Decline",
                                  style: utils.smallTitleBoldTextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: Colors.white,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, loginScreenRoute, (route) => false);
                            },
                            child: Container(
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Delete",
                                  style: utils.smallTitleBoldTextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
