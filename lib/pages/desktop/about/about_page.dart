// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/desktop/about/widget/about_me_section.dart';
import 'package:portfolio_flutter/pages/desktop/about/widget/education_section.dart';
import 'package:portfolio_flutter/pages/desktop/about/widget/experience_section.dart';
import 'package:portfolio_flutter/pages/desktop/about/widget/skills_section.dart';
import 'package:portfolio_flutter/utils/constants.dart';

import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/about_page_item.dart';
import 'package:portfolio_flutter/widgets/education_card.dart';
import 'package:portfolio_flutter/widgets/experience_card.dart';
import 'package:portfolio_flutter/widgets/skill_item.dart';

class DesktopAboutPage extends StatelessWidget {
  const DesktopAboutPage({
    Key? key,
    required this.accent,
  }) : super(key: key);

  final Color accent;

  @override
  Widget build(BuildContext context) {
    Utils.setUiOverlay(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: "${Constants.im}${Constants.name} and ",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.titleLarge?.color),
                  children: [
                    TextSpan(
                        text: Constants.job,
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize,
                            fontWeight: FontWeight.w600,
                            color: accent))
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Constants.aboutMeDescription,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                height: 1.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                  child: AboutMeSection(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: SkillsSection(accent: accent),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
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

            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Flexible(
                  child: EducationSection(),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: ExperienceSection(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}