import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          Color accent = provider.accent;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              iconTheme: IconThemeData(color: accent),
              title: const AppBarText(text: "Home"),
            ),
            drawer: const CustomDrawer(),
            body: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              padding: EdgeInsets.all(Dimensions.height20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: Dimensions.width / 2,
                        height: Dimensions.width / 2 * 4 / 3,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.width20),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/photo.webp",
                                )))),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    RichText(
                      text: TextSpan(
                          text: Constants.hello,
                          style: TextStyle(
                              fontSize: Dimensions.height25,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.color),
                          children: [
                            TextSpan(
                                text: Constants.name,
                                style: TextStyle(
                                    fontFamily: 'ClickerScript',
                                    fontSize: Dimensions.height25,
                                    color: accent))
                          ]),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    RichText(
                      text: TextSpan(
                          text: Constants.im,
                          style: TextStyle(
                              fontSize: Dimensions.height25,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.color),
                          children: [
                            TextSpan(
                                text: Constants.job,
                                style: TextStyle(
                                    fontSize: Dimensions.height25,
                                    fontWeight: FontWeight.w600,
                                    color: accent))
                          ]),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Text(
                      Constants.jobDescription,
                      style: TextStyle(
                          fontSize: Dimensions.height10 * 1.8,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),

                    /* RichText(
                    text: TextSpan(
                      text: Constants.jobDescription,
                      style: TextStyle(
                          fontSize: Dimensions.height10 * 1.8,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    ),
                  ),*/
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    CustomElevatedButton(
                      text: Constants.downloadCv,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
