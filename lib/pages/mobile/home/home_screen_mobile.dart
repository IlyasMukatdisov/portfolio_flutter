import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/mobile/about/about_page.dart';
import 'package:portfolio_flutter/pages/mobile/contact/contact_page.dart';
import 'package:portfolio_flutter/pages/mobile/portfolio/portfolio_page.dart';
import 'package:portfolio_flutter/pages/mobile/services/services_page.dart';
import 'package:portfolio_flutter/pages/mobile/settings/settings_page.dart';
import 'package:portfolio_flutter/provider/page_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:url_launcher/link.dart';

class HomeScreenMobile extends ConsumerWidget {
  const HomeScreenMobile({
    super.key,
    required this.accent,
  });

  final Color accent;

  final List<BottomNavigationBarItem> _navItems = const [
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
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(pageIndexProvider.notifier).state;

    final List<Widget> screens = [
      MobileHomeScreenContent(
        accent: accent,
      ),
      MobileAboutPage(
        accent: accent,
      ),
      MobileServicesPage(
        accent: accent,
      ),
      MobilePortfolioPage(
        accent: accent,
      ),
      MobileContactPage(
        accent: accent,
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
        selectedItemColor: accent,
        unselectedItemColor:
            Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
        onTap: (int index) {
          ref.read(pageIndexProvider.notifier).state = index;
        },
        currentIndex: selectedIndex,
        items: _navItems,
      ),
      body: SafeArea(child: screens[selectedIndex]),
    );
  }
}

class MobileHomeScreenContent extends StatelessWidget {
  const MobileHomeScreenContent({
    super.key,
    required this.accent,
  });

  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/photo.webp",
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                text: Constants.hello,
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.titleLarge?.color),
                children: [
                  TextSpan(
                    text: Constants.name,
                    style: TextStyle(
                      fontFamily: 'ClickerScript',
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium?.fontSize,
                      color: accent,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: Constants.im,
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.titleLarge?.color),
                  children: [
                    TextSpan(
                        text: Constants.job,
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize,
                            fontWeight: FontWeight.w600,
                            color: accent))
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Constants.jobDescription,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.normal,
                  height: 1.5),
            ),
            const SizedBox(
              height: 20,
            ),
            Link(
              target: LinkTarget.blank,
              uri: Uri.parse(Constants.CV_URL),
              builder: (context, followLink) => CustomElevatedButton(
                text: Constants.downloadCv,
                onPressed: followLink!,
                accent: accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
