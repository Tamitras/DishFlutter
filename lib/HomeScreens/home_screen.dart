import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_manager/Constants/app_constants.dart';
import 'package:food_manager/Utilities/app_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();
  var utils = AppUtils();
  List selected = [
    false,
    false,
    false,
    false,
    false,
  ];
  List selected2 = [
    false,
    false,
    false,
    false,
    false,
  ];
  bool frequentlyUsedTags = true;
  bool relatedTags = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Let's create the \nawesome food!",
                    style: utils.largeTitleBoldTextStyle(
                      color: blueColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: utils.textField(
                      controller: searchController,
                      onChanged: (val) {
                        setState(() {});
                      },
                      hintText: "Search",
                      isObscure: false,
                      prefixIcon: Image.asset(
                        "assets/searchIcon.png",
                        color: blueColor,
                        scale: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              searchController.text != ""
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Frequently Used Tags",
                          style: utils.mediumTitleBoldTextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            frequentlyUsedTags = !frequentlyUsedTags;
                            setState(() {});
                          },
                          child: Icon(
                            frequentlyUsedTags == true
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              searchController.text != ""
                  ? const SizedBox(
                      height: 10,
                    )
                  : Container(),
              searchController.text != "" && frequentlyUsedTags == true
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              onTap: () {
                                selected[i] = !selected[i];
                                setState(() {});
                              },
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: selected[i] == true
                                      ? blueColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: selected[i] == true
                                        ? Colors.transparent
                                        : blueColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "#Food",
                                    style: utils.smallTitleTextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              searchController.text != ""
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Related Tags",
                          style: utils.mediumTitleBoldTextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            relatedTags = !relatedTags;
                            setState(() {});
                          },
                          child: Icon(
                            relatedTags == true
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              searchController.text != ""
                  ? const SizedBox(
                      height: 10,
                    )
                  : Container(),
              searchController.text != "" && relatedTags == true
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              onTap: () {
                                selected2[i] = !selected2[i];
                                setState(() {});
                              },
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: selected2[i] == true
                                      ? blueColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: selected2[i] == true
                                        ? Colors.transparent
                                        : blueColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "#Food",
                                    style: utils.smallTitleTextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  : Container(),
              searchController.text != ""
                  ? const SizedBox(
                      height: 20,
                    )
                  : Container(),
              for (int i = 0; i < 2; i++)
                searchController.text != ""
                    ? Container(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    backgroundColor: blueColor,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                  ),
                                  SlidableAction(
                                    onPressed: (_) {
                                      dialogBox();
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    backgroundColor:
                                        Colors.black.withOpacity(0.4),
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
                      )
                    : Container(),
              searchController.text == ""
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Favourite Recipes",
                              style: utils.mediumTitleBoldTextStyle(
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, allRecipeScreenRoute);
                              },
                              child: Text(
                                "See More",
                                style: utils.smallTitleBoldTextStyle(
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < 2; i++)
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        backgroundColor: blueColor,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                      ),
                                      SlidableAction(
                                        onPressed: (_) {
                                          dialogBox();
                                        },
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        backgroundColor:
                                            Colors.black.withOpacity(0.4),
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
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recently Added Recipes",
                              style: utils.mediumTitleBoldTextStyle(
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, allRecipeScreenRoute);
                              },
                              child: Text(
                                "See More",
                                style: utils.smallTitleBoldTextStyle(
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < 2; i++)
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        backgroundColor: blueColor,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                      ),
                                      SlidableAction(
                                        onPressed: (_) {
                                          dialogBox();
                                        },
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        backgroundColor:
                                            Colors.black.withOpacity(0.4),
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
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All Recipes",
                              style: utils.mediumTitleBoldTextStyle(
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, allRecipeScreenRoute);
                              },
                              child: Text(
                                "See More",
                                style: utils.smallTitleBoldTextStyle(
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < 2; i++)
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        backgroundColor: blueColor,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                      ),
                                      SlidableAction(
                                        onPressed: (_) {
                                          dialogBox();
                                        },
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        backgroundColor:
                                            Colors.black.withOpacity(0.4),
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
                        const SizedBox(
                          height: 130,
                        ),
                      ],
                    )
                  : Container(),
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
