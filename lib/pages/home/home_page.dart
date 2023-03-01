import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:url_launcher/link.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

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
        title: const AppBarText(text: "Home"),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        padding: EdgeInsets.all(dimensions.height20!),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: dimensions.width! / 2,
                  height: dimensions.width! / 2 * 4 / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dimensions.width20!),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/photo.webp",
                          )))),
              SizedBox(
                height: dimensions.height30,
              ),
              RichText(
                text: TextSpan(
                    text: Constants.hello,
                    style: TextStyle(
                        fontSize: dimensions.height25,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.titleLarge?.color),
                    children: [
                      TextSpan(
                          text: Constants.name,
                          style: TextStyle(
                              fontFamily: 'ClickerScript',
                              fontSize: dimensions.height25,
                              color: accent))
                    ]),
              ),
              SizedBox(
                height: dimensions.height20,
              ),
              RichText(
                text: TextSpan(
                    text: Constants.im,
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
                Constants.jobDescription,
                style: TextStyle(
                    fontSize: dimensions.height10! * 1.8,
                    fontWeight: FontWeight.normal,
                    height: 1.5),
              ),
              SizedBox(
                height: dimensions.height20,
              ),
              Link(
                target: LinkTarget.blank,
                uri: Uri.parse(Constants.CV_URL),
                builder: (context, followLink) => CustomElevatedButton(
                    text: Constants.downloadCv, onPressed: followLink!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
