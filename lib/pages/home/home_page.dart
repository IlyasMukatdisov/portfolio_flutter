import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/desktop/home/home_page_desktop.dart';
import 'package:portfolio_flutter/pages/mobile/home/home_screen_mobile.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';

import 'package:portfolio_flutter/utils/utils.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    // ignore: unused_local_variable
    String accent = ref.watch(themeProvider)[Constants.ACCENT_KEY]!;
    Color accentColor = ref.read(themeProvider.notifier).accent;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Constants.DESKTOP_WIDTH) {
          return HomeScreenMobile(accent: accentColor);
        } else {
          return HomeScreenDesktop(
            accent: accentColor,
          );
        }
      },
    );
  }
}
