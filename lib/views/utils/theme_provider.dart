import 'package:flutter/material.dart';
import 'package:pocket_tasks/views/styles/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _currentTheme = AppThemes.defaultLight;
  late ThemeData _currentDarkTheme = AppThemes.defaultDark;

  ThemeData get currentTheme => _currentTheme;
  ThemeData get currentDarkTheme => _currentDarkTheme;

  Future<void> setTheme(String themeId) async {
    _currentTheme = stringToTheme(themeId);
    _currentDarkTheme = stringToTheme(themeId, isDarkMode: true);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userTheme', themeId);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeId = prefs.getString('userTheme');

    if (themeId != null) {
      _currentTheme = stringToTheme(themeId);
      _currentDarkTheme = stringToTheme(themeId, isDarkMode: true);

      notifyListeners();
    }
  }

  ThemeData stringToTheme(String themeString, {bool isDarkMode = false}) {
    switch (themeString) {
      case 'default':
        return isDarkMode ? AppThemes.defaultDark : AppThemes.defaultLight;
      case 'sakura':
        return isDarkMode ? AppThemes.sakuraDark : AppThemes.sakuraLight;
      default:
        return isDarkMode ? AppThemes.defaultDark : AppThemes.defaultLight;
    }
  }
}
