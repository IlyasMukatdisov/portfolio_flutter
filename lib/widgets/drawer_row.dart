import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

class DrawerRow extends StatelessWidget {
  final Widget toPage;
  final IconData icon;
  final Color iconColor;
  final String text;

  const DrawerRow({Key? key,
    required this.icon,
    this.iconColor = Colors.redAccent,
    required this.text,
    required this.toPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.context = context;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => toPage));
      },
      child: Container(
        width: Dimensions.width100 * 2.3,
        decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(width: 1, color: AppColors.black50)),
        ),
        margin: EdgeInsets.only(bottom: Dimensions.height20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
            SizedBox(
              width: Dimensions.width20,
            ),
            Text(text,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text900))
          ],
        ),
      ),
    );
  }
}
