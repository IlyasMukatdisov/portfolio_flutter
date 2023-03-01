import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/about/about_page.dart';
import 'package:portfolio_flutter/pages/contact/contact_page.dart';
import 'package:portfolio_flutter/pages/home/home_page.dart';
import 'package:portfolio_flutter/pages/portfolio/portfolio_page.dart';
import 'package:portfolio_flutter/pages/services/services_page.dart';
import 'package:portfolio_flutter/pages/settings/settings_page.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/widgets/drawer_row.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color accent = ref.read(themeProvider.notifier).accent;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerRow(
              icon: Icons.home,
              iconColor: accent,
              text: "Home",
              toPage: const HomePage()),
          DrawerRow(
              icon: Icons.person,
              iconColor: accent,
              text: "About",
              toPage: const AboutPage()),
          DrawerRow(
              icon: Icons.list,
              iconColor: accent,
              text: "Services",
              toPage: const ServicesPage()),
          DrawerRow(
              icon: Icons.folder,
              iconColor: accent,
              text: "Portfolio",
              toPage: const PortfolioPage()),
          DrawerRow(
              icon: Icons.comment,
              iconColor: accent,
              text: "Contact",
              toPage: const ContactPage()),
          DrawerRow(
              icon: Icons.settings,
              iconColor: accent,
              text: "Settings",
              toPage: const SettingsPage()),
        ],
      ),
    );
  }
}
