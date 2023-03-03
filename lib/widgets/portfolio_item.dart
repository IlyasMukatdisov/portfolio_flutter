import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class PortfolioItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String url;

  const PortfolioItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            imagePath,
            height: 400,
          ),
          const SizedBox(
            height: 10,
          ),
          Link(
            target: LinkTarget.blank,
            uri: Uri.parse(url),
            builder: (context, followLink) => TextButton(
              onPressed: followLink!,
              child: const Text('Check on GitHub'),
            ),
          ),
        ],
      ),
    );
  }
}
