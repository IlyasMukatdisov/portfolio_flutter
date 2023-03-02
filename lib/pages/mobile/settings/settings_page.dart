import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/constants.dart';

import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    Color accent = ref.watch(themeProvider.notifier).accent;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: accent),
          title: const AppBarText(text: "Settings"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text("UI Mode: "),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                        value: ref.watch(themeProvider)[Constants.UI_MODE_KEY],
                        items: [
                          DropdownMenuItem<String>(
                            value: Constants.UI_MODE_LIGHT,
                            child: Text(
                              'Light',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: Constants.UI_MODE_DARK,
                            child: Text(
                              'Dark',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: Constants.UI_MODE_SYSTEM,
                            child: Text(
                              'System',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                        onChanged: (String? value) {
                          ref
                              .read(themeProvider.notifier)
                              .changeTheme(value ?? Constants.UI_MODE_SYSTEM);
                        }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text("Accent: "),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeColors(Constants.ACCENT_RED);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.red),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeColors(Constants.ACCENT_YELLOW);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.yellow),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeColors(Constants.ACCENT_GREEN);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.green),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeColors(Constants.ACCENT_BLUE);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.blue),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeColors(Constants.ACCENT_PURPLE);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.purple),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
