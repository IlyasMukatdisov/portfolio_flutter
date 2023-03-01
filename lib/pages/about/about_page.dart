// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/about_page_item.dart';
import 'package:portfolio_flutter/widgets/education_card.dart';
import 'package:portfolio_flutter/widgets/experience_card.dart';
import 'package:portfolio_flutter/widgets/skill_item.dart';

class MobileAboutPage extends StatelessWidget {
  const MobileAboutPage({
    Key? key,
    required this.dimensions,
    required this.accent,
  }) : super(key: key);

  final Dimensions dimensions;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    Utils.setUiOverlay(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(dimensions.height20!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: "${Constants.im}${Constants.name} and ",
                  style: TextStyle(
                      fontSize: dimensions.height25,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.titleLarge?.color),
                  children: [
                    TextSpan(
                        text: Constants.job,
                        style: TextStyle(
                            fontSize: dimensions.height25,
                            fontWeight: FontWeight.w600,
                            color: accent))
                  ]),
            ),
            SizedBox(
              height: dimensions.height20,
            ),
            Text(
              Constants.aboutMeDescription,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: dimensions.height20,
            ),
            const AboutPageItem(header: "Birthday :", value: "18 Jan 2001"),
            const AboutPageItem(header: "Age :", value: "21"),
            const AboutPageItem(
                header: "Website :", value: "portfoliohosting-ad525.web.app"),
            const AboutPageItem(
                header: "Email :", value: "mukatdisovilyas@gmail.com"),
            const AboutPageItem(header: "Degree :", value: "Bachelor's 3 stage"),
            const AboutPageItem(header: "Phone :", value: "+998946235947"),
            const AboutPageItem(header: "City :", value: "Tashkent, Uzbekistan"),
            const AboutPageItem(header: "Telegram :", value: "@MainActivityDotKt"),
            SizedBox(
              height: dimensions.height20! * 2,
            ),
            // CustomElevatedButton(
            //     onPressed: () async {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => MobileContactPage(
            //             accent: accent,
            //             dimensions: dimensions,
            //           ),
            //         ),
            //       );
            //     },
            //     text: "Hire Me"),
            SizedBox(
              height: dimensions.height20! * 2,
            ),
            Text(
              "Skills :",
              style: TextStyle(
                  fontSize: dimensions.height20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: dimensions.height20,
            ),
            const SkillItem(skillName: "Flutter", skillPercent: 0.25),
            const SkillItem(skillName: "Dart", skillPercent: 0.75),
            const SkillItem(skillName: "Kotlin", skillPercent: 0.8),
            const SkillItem(skillName: "Jetpack Compose", skillPercent: 0.2),
            Text(
              "Education :",
              style: TextStyle(
                  fontSize: dimensions.height20,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: dimensions.height20,
            ),
            const EducationCard(),
            SizedBox(
              height: dimensions.height20,
            ),
            Text(
              "Experience :",
              style: TextStyle(
                  fontSize: dimensions.height20,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: dimensions.height20,
            ),
            const ExperienceCard(),
          ],
        ),
      ),
    );
  }
}
