import 'package:flutter/material.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:provider/provider.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Dimensions.context = context;
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        Color accent = provider.accent;
        return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                primary: accent,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20 * 2,
                    vertical: Dimensions.width20),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height20 * 2))),
            child: Text(text,
                style: TextStyle(
                    fontSize: Dimensions.height10 * 1.6,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)));
      },
    );
  }
}
