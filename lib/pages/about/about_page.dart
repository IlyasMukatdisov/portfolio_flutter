import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.context = context;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.red),
          title: AppBarText(text: "About me"),
        ),
        drawer: const CustomDrawer(),
        body: Container(
          padding: EdgeInsets.all(Dimensions.height20),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                    text: "${Constants.im}${Constants.name} and ",
                    style: GoogleFonts.poppins(
                        fontSize: Dimensions.height25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text900),
                    children: [
                      TextSpan(
                          text: Constants.job,
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.height25,
                              fontWeight: FontWeight.w600,
                              color: Colors.red))
                    ]),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Text(
                Constants.aboutMeDescription,
                style: GoogleFonts.poppins(
                  fontSize: Dimensions.height10 * 1.6,
                  fontWeight: FontWeight.normal,
                  color: AppColors.text700,
                  height: 1.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
