import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reqres/utils/text_theme_style_x.dart';

class KTitleText extends StatelessWidget {
  const KTitleText(
    this.title, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.style,
  }) : super(key: key);

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ??
          context.labelLarge.copyWith(
            fontSize: fontSize ?? 20.sp,
            fontWeight: fontWeight,
            color: fontColor,
          ),
    );
  }
}
