import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutPageItem extends ConsumerWidget {
  final String header;
  final String value;

  const AboutPageItem({
    Key? key,
    required this.header,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Text(header,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.headlineSmall?.color)),
            const SizedBox(
              width: 10,
            ),
            Text(value,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).textTheme.bodyLarge?.color)),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
