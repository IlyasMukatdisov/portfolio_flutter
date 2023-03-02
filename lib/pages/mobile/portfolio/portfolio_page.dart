import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio_flutter/utils/utils.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My last projects: ",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.titleLarge?.color),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/portfolio/easy_calculator.webp"),
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/portfolio/compose_calculator.webp"),
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/portfolio/Movies.webp"),
          ],
        ),
      ),
    );
  }
}
