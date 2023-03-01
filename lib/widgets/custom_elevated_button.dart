import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

class CustomElevatedButton extends ConsumerWidget {
  final Future<void> Function() onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Dimensions dimensions = Dimensions(context: context);
    Color accent = ref.read(themeProvider.notifier).accent;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        // padding: EdgeInsets.symmetric(
        //     horizontal: dimensions.width20! * 2, vertical: dimensions.width20!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dimensions.height20! * 2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimensions.width20! * 2, vertical: dimensions.width20!),
        child: Text(
          text,
          style: TextStyle(
            fontSize: dimensions.height10! * 1.6,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
