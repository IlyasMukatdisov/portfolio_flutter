import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/portfolio_item.dart';

class DesktopPortfolioPage extends ConsumerWidget {
  const DesktopPortfolioPage({
    Key? key,
    required this.accent,
  }) : super(key: key);

  final Color accent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "My Projects: ",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.titleLarge?.color),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                PortfolioItem(
                  imagePath: "assets/images/portfolio/educode.webp",
                  name: 'EduCode',
                  url: 'https://github.com/IlyasMukatdisov/educode',
                ),
                PortfolioItem(
                  imagePath: "assets/images/portfolio/mychat.webp",
                  name: 'My Chat',
                  url: 'https://github.com/IlyasMukatdisov/mychat',
                ),
                PortfolioItem(
                  imagePath: "assets/images/portfolio/portfolio.webp",
                  name: 'Portfolio',
                  url: 'https://github.com/IlyasMukatdisov/portfolio_flutter',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
