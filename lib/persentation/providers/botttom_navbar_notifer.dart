import 'package:flutter/widgets.dart';

class BottomNavBarNotifier extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int newVal) {
    _currentIndex = newVal;
    notifyListeners();
  }
}
