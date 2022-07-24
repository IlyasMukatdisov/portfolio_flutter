import 'package:flutter/material.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:provider/provider.dart';

class DrawerRow extends StatelessWidget {
  final Widget toPage;
  final IconData icon;
  final Color iconColor;
  final String text;

  const DrawerRow(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.text,
      required this.toPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context: context);
    return Consumer<ThemeProvider>(
      builder: (BuildContext contextP, provider, Widget? child) {
        var theme = provider.currentTheme;
        bool isDarkMode = false;
        switch (theme) {
          case Constants.UI_MODE_LIGHT:
            isDarkMode = false;
            break;
          case Constants.UI_MODE_DARK:
            isDarkMode = true;
            break;
          default:
            isDarkMode =
                MediaQuery.of(context).platformBrightness == Brightness.dark;
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => toPage));
          },
          child: Container(
            width: dimensions.width100! * 2.3,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.5)
                          : Colors.black.withOpacity(0.2))),
            ),
            margin: EdgeInsets.only(bottom: dimensions.height20!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
                SizedBox(
                  width: dimensions.width20,
                ),
                Text(text,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.titleLarge?.color))
              ],
            ),
          ),
        );
      },
    );
  }
}
