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

    Dimensions dimensions = Dimensions(context: context);
    return Consumer<ThemeProvider>(
      builder: (contextP, provider, child) {
        Color accent = provider.accent;
        return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                primary: accent,
                padding: EdgeInsets.symmetric(
                    horizontal: dimensions.width20! * 2,
                    vertical: dimensions.width20!),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(dimensions.height20! * 2))),
            child: Text(text,
                style: TextStyle(
                    fontSize: dimensions.height10! * 1.6,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)));
      },
    );
  }
}
