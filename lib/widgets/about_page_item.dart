import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';

class AboutPageItem extends ConsumerWidget {
  final String header;
  final String value;

  const AboutPageItem({
    Key? key,
    required this.header,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String uiMode = ref.read(themeProvider)[Constants.UI_MODE_KEY]!;
    bool isDarkMode = false;
    switch (uiMode) {
      case Constants.UI_MODE_DARK:
        isDarkMode = true;
        break;
      case Constants.UI_MODE_LIGHT:
        isDarkMode = false;
        break;
      case Constants.UI_MODE_SYSTEM:
        {
          var brightness =
              SchedulerBinding.instance.platformDispatcher.platformBrightness;
          isDarkMode = brightness == Brightness.dark;
        }
        break;
    }

    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.2),
                  width: 2))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(header,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.headlineSmall?.color)),
          Text(value,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.bodyLarge?.color)),
        ],
      ),
    );
  }
}
