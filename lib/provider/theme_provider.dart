import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeNotifier, Map<String, String>>(
  () => ThemeNotifier(),
);

class ThemeNotifier extends Notifier<Map<String, String>> {
  ThemeNotifier() : super();

  @override
  Map<String, String> build() {
    return {
      Constants.UI_MODE_KEY: Constants.UI_MODE_SYSTEM,
      Constants.ACCENT_KEY: Constants.ACCENT_RED
    };
  }

  ThemeMode get themeMode {
    switch (state[Constants.UI_MODE_KEY]) {
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
    switch (state[Constants.ACCENT_KEY]) {
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
    final SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(Constants.ACCENT_KEY, accent);

    state = {
      Constants.UI_MODE_KEY: state[Constants.UI_MODE_KEY]!,
      Constants.ACCENT_KEY: accent,
    };
  }

  void changeTheme(String theme) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(Constants.UI_MODE_KEY, theme);

    state = {
      Constants.UI_MODE_KEY: theme,
      Constants.ACCENT_KEY: state[Constants.ACCENT_KEY]!,
    };
  }

  void initialize() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String theme =
        pref.getString(Constants.UI_MODE_KEY) ?? Constants.UI_MODE_SYSTEM;
    String accent =
        pref.getString(Constants.ACCENT_KEY) ?? Constants.ACCENT_RED;

    state = {
      Constants.UI_MODE_KEY: theme,
      Constants.ACCENT_KEY: accent,
    };
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
