import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: isDarkMode == true ? Colors.black : Colors.white,
          statusBarIconBrightness:
              isDarkMode == true ? Brightness.light : Brightness.dark),
    );

    Dimensions.context = context;

    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          Color accent = provider.accent;
          
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              iconTheme: IconThemeData(color: accent),
              title: const AppBarText(text: "Settings"),
            ),
            drawer: const CustomDrawer(),
            body: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: EdgeInsets.all(Dimensions.height20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("UI Mode: "),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                              value: provider.currentTheme,
                              items: [
                                DropdownMenuItem<String>(
                                  value: Constants.UI_MODE_LIGHT,
                                  child: Text(
                                    'Light',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: Constants.UI_MODE_DARK,
                                  child: Text(
                                    'Dark',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: Constants.UI_MODE_SYSTEM,
                                  child: Text(
                                    'System',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                              onChanged: (String? value) {
                                provider.changeTheme(
                                    value ?? Constants.UI_MODE_SYSTEM);
                              }),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("Accent: "),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.changeColors(Constants.ACCENT_RED);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.red),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.changeColors(Constants.ACCENT_YELLOW);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.yellow),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.changeColors(Constants.ACCENT_GREEN);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.green),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.changeColors(Constants.ACCENT_BLUE);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.blue),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.changeColors(Constants.ACCENT_PURPLE);
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
                )),
          );
        },
      ),
    );
  }
}
