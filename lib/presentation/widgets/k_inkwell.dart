import 'package:flutter/material.dart';
import 'package:reqres/utils/text_theme_style_x.dart';

import '../../utils/dimensions.dart';

class KInkWell extends StatelessWidget {
  const KInkWell(
      {Key? key,
      required this.child,
      this.onTap,
      this.borderRadius,
      this.radius,
      this.rippleColor})
      : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? rippleColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ??
            BorderRadius.circular(Dimensions.defaultBorderRadius),
        radius: radius,
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return rippleColor?.withOpacity(.12) ??
                context.color.onPrimaryContainer.withOpacity(0.12);
          }
          if (states.contains(MaterialState.focused)) {
            return rippleColor?.withOpacity(.12) ??
                context.color.onPrimaryContainer.withOpacity(0.12);
          }
          if (states.contains(MaterialState.pressed)) {
            return rippleColor?.withOpacity(.12) ??
                context.color.onPrimaryContainer.withOpacity(0.12);
          }
          if (states.contains(MaterialState.selected)) {
            return rippleColor?.withOpacity(.12) ??
                context.color.onPrimaryContainer.withOpacity(0.12);
          }
          return null;
        }),
        child: child,
      ),
    );
  }
}
