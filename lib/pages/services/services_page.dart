import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/service_card.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: isDarkMode == true ? Colors.black : Colors.white,
          statusBarIconBrightness:
              isDarkMode == true ? Brightness.light : Brightness.dark),
    );

    Dimensions.context = context;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.red),
          title: const AppBarText(text: "Services"),
        ),
        drawer: const CustomDrawer(),
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: EdgeInsets.all(Dimensions.height20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ServiceCard(
                      icon: Icons.phone_android,
                      header: "Android Native App",
                      description: "Create Android Native Apps",
                      iconColor: Colors.red),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  ServiceCard(
                      icon: Icons.laptop,
                      header: "Flutter App",
                      description: "Create Flutter Apps",
                      iconColor: Colors.red),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  ServiceCard(
                      icon: Icons.web_asset,
                      header: "Simple Website",
                      description: "Create Simple Website",
                      iconColor: Colors.red),
                ],
              ),
            )),
      ),
    );
  }
}
