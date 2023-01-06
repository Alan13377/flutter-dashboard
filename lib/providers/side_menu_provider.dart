import 'package:flutter/cupertino.dart';

class SideMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isMenuOpen = false;

  String _currentPage = "";

  String get currentPage => _currentPage;

  set currentPage(String currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  void setCurrentPage(String routeName) {
    currentPage = routeName;
    notifyListeners();
  }

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isMenuOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isMenuOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isMenuOpen) ? menuController.reverse() : menuController.forward();
    isMenuOpen != isMenuOpen;
  }
}
