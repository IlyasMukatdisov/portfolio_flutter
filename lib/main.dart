import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/home/home_page.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/scroll_behavior.dart';

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
    Color accent = ref.read(themeProvider.notifier).accent;
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
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF6200EE),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: accent, foregroundColor: Colors.white),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFBB86FC),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: accent, foregroundColor: Colors.white),
      ),
      home: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: 'Poppins',
            ),
        child: const HomePage(),
      ),
    );
  }
}
