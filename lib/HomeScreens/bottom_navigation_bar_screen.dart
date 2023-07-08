import 'package:flutter/material.dart';
import 'package:food_manager/Constants/app_constants.dart';
import 'package:food_manager/HomeScreens/settings_screen.dart';
import 'Favourite_recipes_screen.dart';
import 'edit_meals_screen.dart';
import 'home_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with SingleTickerProviderStateMixin {
  var _tabIndex = 0;
  tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  final iconList = [
    Image.asset(
      "assets/homeIcon.png",
      scale: 22,
    ),
    Image.asset(
      "assets/editMealsIcon.png",
      scale: 22,
    ),
    Image.asset(
      "assets/searchIcon.png",
      scale: 22,
    ),
    Image.asset(
      "assets/settingsIcon.png",
      scale: 22,
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        selectedItemColor: blueColor,
        backgroundColor: blackColor,
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        iconSize: 20,
        onTap: (index) {
          tabIndex(index);
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
          setState(() {});
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex(v);
        },
        children: const [
          HomeScreen(),
          EditMealsScreen(),
          FavouriteRecipeScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }
}
