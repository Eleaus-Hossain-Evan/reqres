import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/dimensions.dart';
import 'widget.dart';

class KTitleListView extends HookConsumerWidget {
  const KTitleListView(
      {super.key,
      required this.title,
      this.titleTextStyle,
      this.shrinkWrap = true,
      this.physics = const NeverScrollableScrollPhysics(),
      required this.builder,
      this.separator,
      required this.count,
      this.scrollDirection = Axis.vertical,
      this.gap = 10,
      this.controller,
      this.edgePadding,
      this.padding});

  final String title;
  final TextStyle? titleTextStyle;

  final bool shrinkWrap;
  final ScrollPhysics physics;
  final Widget Function(BuildContext context, int index) builder;
  final Widget? separator;
  final int count;
  final Axis scrollDirection;
  final double gap;
  final ScrollController? controller;
  final double? edgePadding;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KTitleText(
            title,
            fontSize: titleTextStyle?.fontSize,
            fontWeight: titleTextStyle?.fontWeight,
            fontColor: titleTextStyle?.color,
          ),
          const GapHight(gap: 4),
          KListViewSeparated(
            padding: padding,
            builder: builder,
            count: count,
            controller: controller,
            edgePadding: edgePadding,
            gap: gap,
            key: key,
            physics: physics,
            scrollDirection: scrollDirection,
            separator: separator,
            shrinkWrap: shrinkWrap,
          )
        ],
      ),
    );
  }
}
