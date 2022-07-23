import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'system';

  String currentAccent = 'red';

  ThemeMode get themeMode {
    switch (currentTheme) {
      case Constants.UI_MODE_LIGHT:
        return ThemeMode.light;
      case Constants.UI_MODE_DARK:
        return ThemeMode.dark;
      case Constants.UI_MODE_SYSTEM:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  Color get accent {
    switch (currentAccent) {
      case Constants.ACCENT_RED:
        return AppColors.red;
      case Constants.ACCENT_YELLOW:
        return AppColors.yellow;
      case Constants.ACCENT_GREEN:
        return AppColors.green;
      case Constants.ACCENT_BLUE:
        return AppColors.blue;
      case Constants.ACCENT_PURPLE:
        return AppColors.purple;
      default:
        return AppColors.red;
    }
  }

  void changeColors(String accent) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();

    await _pref.setString(Constants.ACCENT_KEY, accent);

    currentAccent = accent;
    notifyListeners();
  }

  void changeTheme(String theme) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();

    await _pref.setString(Constants.UI_MODE_KEY, theme);

    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    currentTheme =
        _pref.getString(Constants.UI_MODE_KEY) ?? Constants.UI_MODE_SYSTEM;
    currentAccent = _pref.getString(Constants.ACCENT_KEY) ?? Constants.ACCENT_RED;

    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: const Color(0xFF121212),
      primaryColor: const Color(0xFFBB86FC),
      colorScheme: const ColorScheme
          .dark() /*const ColorScheme(
        primary: Color(0xFFBB86FC),
        primaryContainer: Color(0xFF3700B3),
        secondary: Color(0xFF03DAC6),
        background: Color(0xFF121212),
        surface: Color(0xFF121212),
        error: Color(0xFFCF6679),
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onBackground: Colors.white,
        onSurface: Colors.white,
        onError: Colors.black,
        brightness: Brightness.dark,
      )*/
      );

  static final lightTheme = ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xFF6200EE),
      colorScheme: const ColorScheme
          .light() /*const ColorScheme(
        primary: Color(0xFF6200EE),
        primaryContainer: Color(0xFF3700B3),
        secondary: Color(0xFF03DAC6),
        secondaryContainer: Color(0xFF018786),
        background: Colors.white,
        surface: Colors.white,
        error: Color(0xFFB00020),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onBackground: Colors.black,
        onSurface: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      )*/
      );
}
