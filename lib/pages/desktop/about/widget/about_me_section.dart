import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/about_page_item.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AboutPageItem(header: "Birthday :", value: "18 Jan 2001"),
        AboutPageItem(header: "Age :", value: "21"),
        AboutPageItem(
            header: "Website :", value: "portfoliohosting-ad525.web.app"),
        AboutPageItem(header: "Email :", value: "mukatdisovilyas@gmail.com"),
        AboutPageItem(header: "Degree :", value: "Bachelor's 3 stage"),
        AboutPageItem(header: "Phone :", value: "+998946235947"),
        AboutPageItem(header: "City :", value: "Tashkent, Uzbekistan"),
        AboutPageItem(header: "Telegram :", value: "@MainActivityDotKt"),
      ],
    );
  }
}
