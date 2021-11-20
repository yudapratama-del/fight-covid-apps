import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/persentation/pages/bookmark_page.dart';
import 'package:capstone_apps/persentation/pages/home_page.dart';
import 'package:capstone_apps/persentation/pages/profile_page.dart';
import 'package:capstone_apps/persentation/providers/botttom_navbar_notifer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  static const ROUTE_NAME = "/main-page";

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedTab = Provider.of<BottomNavBarNotifier>(context);

    Widget _buildBottomNavBar({
      required BottomNavBarNotifier? bottomNavBarNotifier,
    }) {
      return BottomNavigationBar(
        selectedItemColor: kPurplePrimary,
        unselectedItemColor: kGreySecondary,
        currentIndex: bottomNavBarNotifier!.currentIndex,
        onTap: (index) {
          bottomNavBarNotifier.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      );
    }

    var screens = [
      HomePage(),
      BookmarkPage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: SafeArea(child: screens[selectedTab.currentIndex]),
      bottomNavigationBar: _buildBottomNavBar(
        bottomNavBarNotifier: selectedTab,
      ),
    );
  }
}
