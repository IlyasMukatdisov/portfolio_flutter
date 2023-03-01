import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/service_card.dart';

class ServicesPage extends ConsumerWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Utils.setUiOverlay(context);

    Dimensions dimensions = Dimensions(context: context);
    Color accent = ref.read(themeProvider.notifier).accent;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: accent),
          title: const AppBarText(text: "Services"),
        ),
        drawer: const CustomDrawer(),
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: EdgeInsets.all(dimensions.height20!),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ServiceCard(
                      icon: Icons.phone_android,
                      header: "Android Native App",
                      description: "Create Android Native Apps",
                      iconColor: accent),
                  SizedBox(
                    height: dimensions.height30,
                  ),
                  ServiceCard(
                      icon: Icons.laptop,
                      header: "Flutter App",
                      description: "Create Flutter Apps",
                      iconColor: accent),
                  SizedBox(
                    height: dimensions.height30,
                  ),
                  ServiceCard(
                      icon: Icons.web_asset,
                      header: "Simple Website",
                      description: "Create Simple Website",
                      iconColor: accent),
                ],
              ),
            )),
      ),
    );
  }
}
