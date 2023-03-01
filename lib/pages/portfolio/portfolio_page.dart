import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

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
        title: const AppBarText(text: "Portfolio"),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        padding: EdgeInsets.all(dimensions.height20!),
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
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
      ),
    );
  }
}
