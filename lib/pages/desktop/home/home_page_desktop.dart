import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/pages/desktop/about/about_page.dart';
import 'package:portfolio_flutter/provider/page_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:url_launcher/link.dart';

class HomeScreenDesktop extends ConsumerWidget {
  const HomeScreenDesktop({
    super.key,
    required this.accent,
  });

  final Color accent;

  final List<NavigationRailDestination> _destinations = const [
    NavigationRailDestination(
      label: Text('Home'),
      icon: Icon(Icons.home),
    ),
    NavigationRailDestination(
      label: Text('About'),
      icon: Icon(Icons.person),
    ),
    NavigationRailDestination(
      label: Text('Services'),
      icon: Icon(Icons.list),
    ),
    NavigationRailDestination(
      label: Text('Portfolio'),
      icon: Icon(Icons.folder),
    ),
    NavigationRailDestination(
      label: Text('Contact'),
      icon: Icon(Icons.comment),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> pages = [
      DesktopHomeScreenContent(accent: accent),
      DesktopAboutPage(accent: accent),
      const Center(
        child: Text('3'),
      ),
      const Center(
        child: Text('4'),
      ),
      const Center(
        child: Text('5'),
      ),
    ];

    final int selectedIndex = ref.watch(pageIndexProvider.notifier).state;

    return Scaffold(
      body: Row(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: IntrinsicHeight(
                child: NavigationRail(
                  selectedLabelTextStyle: TextStyle(color: accent),
                  selectedIconTheme: IconThemeData(color: accent),
                  labelType: NavigationRailLabelType.selected,
                  destinations: _destinations,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    ref.read(pageIndexProvider.notifier).state = index;
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: pages[selectedIndex],
          ),
        ],
      ),
    );
  }
}

class DesktopHomeScreenContent extends StatelessWidget {
  const DesktopHomeScreenContent({
    super.key,
    required this.accent,
  });

  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: Constants.hello,
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.fontSize,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.titleSmall?.color),
                        children: [
                          TextSpan(
                              text: Constants.name,
                              style: TextStyle(
                                  fontFamily: 'ClickerScript',
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.fontSize,
                                  color: accent))
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: Constants.im,
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.titleLarge?.color),
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
                        fontSize:
                            Theme.of(context).textTheme.titleLarge?.fontSize,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/photo.webp",
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
