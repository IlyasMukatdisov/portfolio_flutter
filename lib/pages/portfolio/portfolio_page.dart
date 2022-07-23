import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

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
          title: const AppBarText(text: "Portfolio"),
        ),
        drawer: const CustomDrawer(),
        body: Container(
          padding: EdgeInsets.all(Dimensions.height20),
          height: double.maxFinite,
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My last projects: ",
                  style: TextStyle(
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.titleLarge?.color),
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Image.asset("assets/images/portfolio/Easy Calculator.webp"),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Image.asset("assets/images/portfolio/Compose Calculator.webp"),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Image.asset("assets/images/portfolio/Movies.webp"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
