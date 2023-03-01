import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';

class MobilePortfolioPage extends ConsumerWidget {
  const MobilePortfolioPage({
    Key? key,
    required this.dimensions,
    required this.accent,
  }) : super(key: key);

  final Dimensions dimensions;
  final Color accent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(dimensions.height20!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My last projects: ",
              style: TextStyle(
                  fontSize: dimensions.height20,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.titleLarge?.color),
            ),
            SizedBox(
              height: dimensions.height30,
            ),
            Image.asset("assets/images/portfolio/easy_calculator.webp"),
            SizedBox(
              height: dimensions.height30,
            ),
            Image.asset("assets/images/portfolio/compose_calculator.webp"),
            SizedBox(
              height: dimensions.height30,
            ),
            Image.asset("assets/images/portfolio/Movies.webp"),
          ],
        ),
      ),
    );
  }
}
