import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/about/about_page.dart';
import 'package:portfolio_flutter/pages/home/home_page.dart';
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
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerRow(icon: Icons.home, text: "Home", toPage: HomePage()),
            DrawerRow(icon: Icons.person, text: "About", toPage: AboutPage()),
            DrawerRow(icon: Icons.list, text: "Services", toPage: HomePage()),
            DrawerRow(
                icon: Icons.folder, text: "Portfolio", toPage: HomePage()),
            DrawerRow(icon: Icons.comment, text: "Contact", toPage: HomePage()),
          ],
        ),
      ),
    );
  }
}
