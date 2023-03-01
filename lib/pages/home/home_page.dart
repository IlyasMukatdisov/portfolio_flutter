import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/about/about_page.dart';
import 'package:portfolio_flutter/pages/contact/contact_page.dart';
import 'package:portfolio_flutter/pages/portfolio/portfolio_page.dart';
import 'package:portfolio_flutter/pages/services/services_page.dart';
import 'package:portfolio_flutter/pages/settings/settings_page.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:url_launcher/link.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    Dimensions dimensions = Dimensions(context: context);

    String accent = ref.watch(themeProvider)[Constants.ACCENT_KEY]!;
    Color accentColor = ref.read(themeProvider.notifier).accent;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return HomeScreenMobile(accent: accentColor, dimensions: dimensions);
        } else {
          return Scaffold(
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
                            borderRadius:
                                BorderRadius.circular(dimensions.width20!),
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
                              color: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.color),
                          children: [
                            TextSpan(
                                text: Constants.name,
                                style: TextStyle(
                                    fontFamily: 'ClickerScript',
                                    fontSize: dimensions.height25,
                                    color: accentColor))
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
                              color: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.color),
                          children: [
                            TextSpan(
                                text: Constants.job,
                                style: TextStyle(
                                    fontSize: dimensions.height25,
                                    fontWeight: FontWeight.w600,
                                    color: accentColor))
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
      },
    );
  }
}

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({
    super.key,
    required this.accent,
    required this.dimensions,
  });

  final Color accent;
  final Dimensions dimensions;

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      MobileHomeScreenContent(
        widget: widget,
      ),
      MobileAboutPage(
        accent: widget.accent,
        dimensions: widget.dimensions,
      ),
      MobileServicesPage(
        dimensions: widget.dimensions,
        accent: widget.accent,
      ),
      MobilePortfolioPage(
        dimensions: widget.dimensions,
        accent: widget.accent,
      ),
      MobileContactPage(
        dimensions: widget.dimensions,
        accent: widget.accent,
      )
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: widget.accent,
        unselectedItemColor:
            Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'About',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Services',
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: 'Portfolio',
            icon: Icon(Icons.folder),
          ),
          BottomNavigationBarItem(
            label: 'Contact',
            icon: Icon(Icons.comment),
          ),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}

class MobileHomeScreenContent extends StatelessWidget {
  const MobileHomeScreenContent({
    super.key,
    required this.widget,
  });

  final HomeScreenMobile widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(widget.dimensions.height20!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: widget.dimensions.width! / 2,
                height: widget.dimensions.width! / 2 * 4 / 3,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(widget.dimensions.width20!),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/photo.webp",
                        )))),
            SizedBox(
              height: widget.dimensions.height30,
            ),
            RichText(
              text: TextSpan(
                  text: Constants.hello,
                  style: TextStyle(
                      fontSize: widget.dimensions.height25,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.titleLarge?.color),
                  children: [
                    TextSpan(
                        text: Constants.name,
                        style: TextStyle(
                            fontFamily: 'ClickerScript',
                            fontSize: widget.dimensions.height25,
                            color: widget.accent))
                  ]),
            ),
            SizedBox(
              height: widget.dimensions.height20,
            ),
            RichText(
              text: TextSpan(
                  text: Constants.im,
                  style: TextStyle(
                      fontSize: widget.dimensions.height25,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.titleLarge?.color),
                  children: [
                    TextSpan(
                        text: Constants.job,
                        style: TextStyle(
                            fontSize: widget.dimensions.height25,
                            fontWeight: FontWeight.w600,
                            color: widget.accent))
                  ]),
            ),
            SizedBox(
              height: widget.dimensions.height20,
            ),
            Text(
              Constants.jobDescription,
              style: TextStyle(
                  fontSize: widget.dimensions.height10! * 1.8,
                  fontWeight: FontWeight.normal,
                  height: 1.5),
            ),
            SizedBox(
              height: widget.dimensions.height20,
            ),
            Link(
              target: LinkTarget.blank,
              uri: Uri.parse(Constants.CV_URL),
              builder: (context, followLink) => CustomElevatedButton(
                text: Constants.downloadCv,
                onPressed: followLink!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
