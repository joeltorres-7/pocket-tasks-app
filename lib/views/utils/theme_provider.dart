import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppThemes.defaultLight;

  ThemeData get currentTheme => _currentTheme;

  Future<void> setTheme(String themeId) async {
    _currentTheme = stringToTheme(themeId);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userTheme', themeId);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('userTheme');

    if (savedTheme != null) {
      _currentTheme = stringToTheme(savedTheme);
      notifyListeners();
    }
  }

  ThemeData stringToTheme(String themeString) {
    switch (themeString) {
      case 'default ':
        return AppThemes.defaultLight;
      case 'sakura':
        return AppThemes.sakuraLight;
      default:
        return AppThemes.defaultLight;
    }
  }
}