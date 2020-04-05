import 'package:flutter/material.dart';
import 'package:youtube/ui/views/base_view_model.dart';

enum drawerPage { homePage, otherPage }

class MainViewModel extends BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  drawerPage _currentPage = drawerPage.homePage;

  drawerPage get currentPage => _currentPage;

  set currentPage(value) {
    _currentPage = value;
    notifyListeners();
  }

  void onPressedHome() {
    currentPage = drawerPage.homePage;
  }

  void onPressedOther() {
    currentPage = drawerPage.otherPage;
  }

  void onPressedHelp() {
    notifyListeners();
  }

  void onPressedShare() {
    notifyListeners();
  }

  void onPressedAbout() {
    notifyListeners();
  }
}
