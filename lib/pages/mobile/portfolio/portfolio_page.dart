import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/portfolio_item.dart';

class MobilePortfolioPage extends ConsumerWidget {
  const MobilePortfolioPage({
    Key? key,
    required this.accent,
  }) : super(key: key);

  final Color accent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "My last projects: ",
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
                  name: 'Easy calculator',
                  url: 'https://github.com/IlyasMukatdisov/EasyCalculator',
                ),
                PortfolioItem(
                  imagePath: "assets/images/portfolio/mychat.webp",
                  name: 'Compose Calculator',
                  url: 'https://github.com/IlyasMukatdisov/EasyCalculator',
                ),
                PortfolioItem(
                  imagePath: "assets/images/portfolio/portfolio.webp",
                  name: 'Movie',
                  url: 'https://github.com/IlyasMukatdisov/EasyCalculator',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
