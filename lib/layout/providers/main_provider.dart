
import 'package:flutter/material.dart';
// import 'package:kuriftuquest/modules/profile/screens/profile_screen.dart';
class MainProvider extends ChangeNotifier {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // const Text('Home'),
    // const Text('Food'),
    // const Text('Gas'),
    // const ProfilePage(),
  ];

  int get currentIndex => _currentIndex;
  List<Widget> get pages => _pages;

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
