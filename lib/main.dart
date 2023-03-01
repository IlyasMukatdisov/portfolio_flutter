import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/home/home_page.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';

void main() {
  /*SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    await Future.delayed(const Duration(seconds: 3));
    SystemChrome.restoreSystemUIOverlays();
  });*/

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(themeProvider.notifier).initialize();
    String theme = ref.watch(themeProvider)[Constants.UI_MODE_KEY]!;
    ThemeMode themeMode = ThemeMode.system;
    switch (theme) {
      case Constants.UI_MODE_LIGHT:
        themeMode = ThemeMode.light;
        break;
      case Constants.UI_MODE_DARK:
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.dark;
        break;
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home: const HomePage());
  }
}
