import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  bool _isDarkMode = true;

  bool getThemeValue() => _isDarkMode;

  void updateTheme({required bool value}){
    _isDarkMode = value;
    notifyListeners();
  }
}