import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/contact/contact_page.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/about_page_item.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:portfolio_flutter/widgets/education_card.dart';
import 'package:portfolio_flutter/widgets/experience_card.dart';
import 'package:portfolio_flutter/widgets/skill_item.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    Dimensions dimensions = Dimensions(context: context);
    Color accent = ref.read(themeProvider.notifier).accent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: accent),
        title: const AppBarText(text: "About me"),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
              const AboutPageItem(
                  header: "Degree :", value: "Bachelor's 3 stage"),
              const AboutPageItem(header: "Phone :", value: "+998946235947"),
              const AboutPageItem(
                  header: "City :", value: "Tashkent, Uzbekistan"),
              const AboutPageItem(
                  header: "Telegram :", value: "@MainActivityDotKt"),
              SizedBox(
                height: dimensions.height20! * 2,
              ),
              CustomElevatedButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ContactPage()));
                  },
                  text: "Hire Me"),
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
      ),
    );
  }
}
