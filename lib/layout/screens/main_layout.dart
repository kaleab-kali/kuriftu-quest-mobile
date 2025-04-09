import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/dimentsions.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuriftuquest/modules/home/screens/home_screen.dart';
import 'package:kuriftuquest/modules/profile/screens/profile_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          height: screenHeight(context, h: 0.06),
          border:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
          iconSize: 30,
          activeColor: AppColors.primary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Challenge',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Camera',
            ),
           
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Reward',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      tabBuilder: (_, index) {
        switch (index) {
          case 0:
            return const HomeScreen();
          case 1:
            return const Text('Challenge');
          case 2:
            return const Text('Camera');
          case 3:
            return const Text('Reward');
          case 4:
            return ProfilePage();
          default:
            return ProfilePage();
        }
      },
    );
  }
}
