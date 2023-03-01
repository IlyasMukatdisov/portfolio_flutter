// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/service_card.dart';

class MobileServicesPage extends StatelessWidget {
  const MobileServicesPage({
    Key? key,
    required this.dimensions,
    required this.accent,
  }) : super(key: key);

  final Dimensions dimensions;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    Utils.setUiOverlay(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(dimensions.height20!),
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
      ),
    );
  }
}
