import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_theme_style_x.dart';

extension CustomStyle on BuildContext {
  //? Profile Screen
  TextStyle get profileTitleStyle => titleSmall.copyWith(
        fontSize: 18.sp,
        color: color.onTertiaryContainer,
        fontWeight: FontWeight.bold,
      );
  TextStyle get profileSubTitleStyle => titleSmall.copyWith(
        fontSize: 18.sp,
        color: color.onTertiaryContainer,
        fontWeight: FontWeight.w600,
      );
  TextStyle get textFieldLabelTextStyle => bodyLarge.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );

  //? Application Info Screen
  TextStyle get speedDialTooltipStyle => titleSmall.copyWith(
        fontWeight: FontWeight.w500,
        color: color.onPrimary,
      );

  //*Visa Apply Screen
  TextStyle get visaApplyApplicationsTitleStyle => titleMedium.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: .5,
      );

  TextStyle get visaApplyApplicationsSubtitleStyle => subtitle1.copyWith(
        fontSize: 12.sp,
        // fontWeight: FontWeight.w600,
        letterSpacing: .5,
      );

  TextStyle get visaApplyDropDownTextStyle => caption.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        letterSpacing: .6,
      );

  //* Visa CheckList page
  TextStyle get visaCheckBodyContentStyle => titleMedium.copyWith(
        fontWeight: FontWeight.w600,
        color: caption.color!.withOpacity(.6),
      );

  //? Application View Screen
  TextStyle get speedDialLabelStyle => titleSmall.copyWith(
        fontSize: 14.sp,
        color: color.onTertiary,
        fontWeight: FontWeight.w500,
      );
}
