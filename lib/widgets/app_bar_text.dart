import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';

class AppBarText extends StatelessWidget {
  final String text;

  const AppBarText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
              color: AppColors.text900,
          ),
        ),
      ],
    );
  }
}
