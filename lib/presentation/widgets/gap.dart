import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GapHight extends StatelessWidget {
  const GapHight({
    Key? key,
    this.gap,
  }) : super(key: key);

  final double? gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: gap ?? 12.h);
  }
}

class GapWidth extends StatelessWidget {
  const GapWidth({
    Key? key,
    this.gap,
  }) : super(key: key);

  final double? gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: gap ?? 12.w);
  }
}
