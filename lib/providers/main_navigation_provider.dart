import 'package:flutter/material.dart';

class MainNavigationProvider extends ChangeNotifier {
  int currentNavIndex = 0;

  void update() {
    notifyListeners();
  }

  Future<void> changeIndex(String id) async {
    switch (id) {
      case 'home':
        currentNavIndex = 0;
        notifyListeners();
      case 'liked':
        currentNavIndex = 1;
        notifyListeners();
    }
  }
}
