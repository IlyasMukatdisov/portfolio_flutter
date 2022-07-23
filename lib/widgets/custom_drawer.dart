import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/about/about_page.dart';
import 'package:portfolio_flutter/pages/contact/contact_page.dart';
import 'package:portfolio_flutter/pages/home/home_page.dart';
import 'package:portfolio_flutter/pages/portfolio/portfolio_page.dart';
import 'package:portfolio_flutter/pages/services/services_page.dart';
import 'package:portfolio_flutter/pages/settings/settings_page.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/drawer_row.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.context = context;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerRow(
              icon: Icons.home,
              iconColor: AppColors.red,
              text: "Home",
              toPage: const HomePage()),
          DrawerRow(
              icon: Icons.person,
              iconColor: AppColors.red,
              text: "About",
              toPage: const AboutPage()),
          DrawerRow(
              icon: Icons.list,
              iconColor: AppColors.red,
              text: "Services",
              toPage: const ServicesPage()),
          DrawerRow(
              icon: Icons.folder,
              iconColor: AppColors.red,
              text: "Portfolio",
              toPage: const PortfolioPage()),
          DrawerRow(
              icon: Icons.comment,
              iconColor: AppColors.red,
              text: "Contact",
              toPage: const ContactPage()),
          DrawerRow(
              icon: Icons.settings,
              iconColor: AppColors.red,
              text: "Settings",
              toPage: const SettingsPage()),
        ],
      ),
    );
  }
}
