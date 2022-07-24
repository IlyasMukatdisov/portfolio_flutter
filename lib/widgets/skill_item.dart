import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:provider/provider.dart';

class SkillItem extends StatelessWidget {
  final String skillName;
  final double skillPercent;

  const SkillItem({
    Key? key,
    required this.skillName,
    required this.skillPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Dimensions dimensions = Dimensions(context: context);
    double width = dimensions.width! - 2 * dimensions.width20!;
    return Consumer<ThemeProvider>(
      builder: (contextP, provider, child) {
        Color accent = provider.accent;
        
        return Container(
          margin: EdgeInsets.only(bottom: dimensions.height30!),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(skillName,
                      style: TextStyle(
                          fontSize: dimensions.height10! * 1.7,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.titleLarge?.color)),
                  Text("${skillPercent * 100}%",
                      style: TextStyle(
                          fontSize: dimensions.height10! * 1.7,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).textTheme.bodyText1?.color)),
                ],
              ),
              SizedBox(
                height: dimensions.height10,
              ),
              Container(
                width: width,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.2)),
                child: Row(
                  children: [
                    Container(
                      width: width * skillPercent,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: accent),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              )
            ],
          ),
        ); 
      },
    );
  }
}
