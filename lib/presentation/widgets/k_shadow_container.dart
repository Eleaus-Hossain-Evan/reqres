import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/dimensions.dart';
import 'widget.dart';

class KShadowContainer extends StatelessWidget {
  const KShadowContainer({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.opacity,
    this.blur,
    this.spread,
    this.border,
    this.color,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final double? opacity, blur, spread;
  final BoxBorder? border;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.defaultBorderRadius),
        border: border,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .onSurfaceVariant
                .withOpacity(opacity ?? .2),
            blurRadius: blur ?? 12.r,
            spreadRadius: spread ?? 0,
            offset: const Offset(2, 2),
          ),
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .onSurfaceVariant
                .withOpacity(opacity ?? .2),
            blurRadius: blur ?? 12.r,
            spreadRadius: spread ?? 0,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: KInkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
