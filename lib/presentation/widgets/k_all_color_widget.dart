import 'package:flutter/material.dart';
import '../../utils/text_theme_style_x.dart';

class KAllColorWidget extends StatelessWidget {
  const KAllColorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.primary),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.secondary),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.tertiary),
            ),
          ],
        ),
        Wrap(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.primaryContainer),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.secondaryContainer),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.tertiaryContainer),
            ),
          ],
        ),
        Wrap(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.onPrimaryContainer),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.onSecondaryContainer),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.onTertiaryContainer),
            ),
          ],
        ),
        Wrap(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.onPrimary),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.onSecondary),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ColoredBox(color: context.color.onTertiary),
            ),
          ],
        ),
      ],
    );
  }
}
