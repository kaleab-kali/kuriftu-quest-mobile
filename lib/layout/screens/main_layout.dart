// import 'package:kuriftuquest/core/constants/colors/colors.dart';
// import 'package:kuriftuquest/core/constants/dimentsions.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:kuriftuquest/modules/challenges/screens/challenges_screen.dart';
// import 'package:kuriftuquest/modules/home/screens/home_screen.dart';
// import 'package:kuriftuquest/modules/profile/screens/profile_screen.dart';
// import 'package:kuriftuquest/modules/rewards/screens/rewards_screen.dart';
// import 'package:kuriftuquest/modules/scan/screens/scan_screen.dart';

// class MainLayout extends StatelessWidget {
//   const MainLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//           height: screenHeight(context, h: 0.08),
//           border:
//               const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
//           iconSize: 30,
//           activeColor: AppColors.primary,
          
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.assignment),
//               label: 'Challenge',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.camera_alt),
//               label: 'Camera',
//             ),
           
//             BottomNavigationBarItem(
//               icon: Icon(Icons.card_giftcard),
//               label: 'Reward',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ]),
//       tabBuilder: (_, index) {
//         switch (index) {
//           case 0:
//             return const HomeScreen();
//           case 1:
//             return const ChallengesScreen();
//           case 2:
//             return const ScanScreen();
//           case 3:
//             return const RewardsScreen();
//           case 4:
//             return ProfileScreen();
//           default:
//             return const Text('No page found');
//         }
//       },
//     );
//   }
// }

import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:kuriftuquest/modules/challenges/screens/challenges_screen.dart';
import 'package:kuriftuquest/modules/home/screens/home_screen.dart';
import 'package:kuriftuquest/modules/profile/screens/profile_screen.dart';
import 'package:kuriftuquest/modules/rewards/screens/rewards_screen.dart';
import 'package:kuriftuquest/modules/scan/screens/scan_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ChallengesScreen(),
    ScanScreen(),
    RewardsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: AppTextStyles.bodyText1.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
          unselectedLabelStyle: AppTextStyles.bodyText1.copyWith(
            fontSize: 12,
            color: Colors.grey,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              activeIcon: Icon(Icons.assignment),
              label: 'Challenges',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              activeIcon: Icon(Icons.camera_alt),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_outlined),
              activeIcon: Icon(Icons.card_giftcard),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
