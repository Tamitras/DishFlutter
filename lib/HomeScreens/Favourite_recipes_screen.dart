import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Constants/app_constants.dart';
import '../Utilities/app_utils.dart';

class FavouriteRecipeScreen extends StatefulWidget {
  const FavouriteRecipeScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteRecipeScreen> createState() => _FavouriteRecipeScreenState();
}

class _FavouriteRecipeScreenState extends State<FavouriteRecipeScreen> {
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
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 20,
                  ),
                  Text(
                    "Favourite Recipes",
                    style: utils.largeTitleBoldTextStyle(
                      color: blueColor,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < 5; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Builder(
                          builder: (context) => Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: blueColor,
                            ),
                          ),
                        ),
                      ),
                      Slidable(
                        closeOnScroll: true,
                        endActionPane: ActionPane(
                          extentRatio: 0.3,
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (_) {},
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              backgroundColor: blueColor,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                            SlidableAction(
                              onPressed: (_) {
                                dialogBox();
                              },
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              backgroundColor: Colors.black.withOpacity(0.4),
                              foregroundColor: Colors.white,
                              icon: Icons.keyboard_control_outlined,
                            ),
                          ],
                        ),
                        child: utils.fullFoodContainer(
                          onTap: () {
                            Navigator.pushNamed(
                                context, foodDetailsScreenRoute);
                          },
                          context: context,
                          image: const AssetImage(
                            "assets/homeBackground.png",
                          ),
                          foodImage: const AssetImage(
                            "assets/backgroundimage.png",
                          ),
                          isFavourite: true,
                          name: "Food Time",
                          lastPrep: "12 Jan",
                          prepTime: "25 Min",
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  dialogBox() {
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
                height: 160,
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
                        child: Text("Options",
                            style: utils.mediumTitleBoldTextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Edit",
                              style: utils.smallTitleBoldTextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Share",
                              style: utils.smallTitleBoldTextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
