import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

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
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2,
                vertical: Dimensions.width20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.height20 * 2))),
        child: Text(text,
            style: GoogleFonts.poppins(
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w600,
                color: Colors.white)));
  }
}