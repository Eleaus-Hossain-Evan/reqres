import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../theme/theme.dart';
import '../utils/color_palate.dart';

final scaffoldKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>((ref) {
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
  return snackbarKey;
});

final snackBarProvider = Provider.family<
    ScaffoldFeatureController<SnackBar, SnackBarClosedReason>,
    String>((ref, String text) {
  final snackbar = ref.watch(scaffoldKeyProvider).currentState!.showSnackBar(
        SnackBar(content: Text(text)),
      );
  return snackbar;
});

showNotification({
  required String title,
  String? theme,
}) {
  bool isDark = theme != null ? theme == 'dark' : false;
  return BotToast.showSimpleNotification(
    title: title,
    align: Alignment.bottomCenter,
    duration: const Duration(milliseconds: 4000),
    // animationDuration: kThemeAnimationDuration,
    dismissDirections: [DismissDirection.horizontal, DismissDirection.up],
    hideCloseButton: true,
    titleStyle: isDark
        ? TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          )
        : TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
    backgroundColor: isDark ? const Color(0xff5e727d) : const Color(0xff3a5e7f),
  );
}

final notification = Provider.family<Function(), String>((ref, String text) {
  final mode = ref.watch(themeProvider).theme;
  final notification = showNotification(theme: mode, title: text);
  return notification;
});

showLoading() => BotToast.showLoading(
      backgroundColor: ColorPalate.botToastBackgroundColor,
    );
closeLoading() => BotToast.closeAllLoading();
