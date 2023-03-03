// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/service_card.dart';

class DesktopServicesPage extends StatelessWidget {
  const DesktopServicesPage({
    Key? key,
    required this.accent,
  }) : super(key: key);

  final Color accent;

  @override
  Widget build(BuildContext context) {
    Utils.setUiOverlay(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: ServiceCard(
                icon: Icons.phone_android,
                header: "Android Native App",
                description: "Create Android Native Apps",
                iconColor: accent,
                width: 400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ServiceCard(
                width: 400,
                icon: Icons.laptop,
                header: "Flutter App",
                description: "Create Flutter Apps",
                iconColor: accent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ServiceCard(
                width: 400,
                icon: Icons.web_asset,
                header: "Simple Website",
                description: "Create Simple Website",
                iconColor: accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
