// ignore_for_file: must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres/utils/custom_style.dart';
import 'package:reqres/utils/text_theme_style_x.dart';

import 'k_inkwell.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    Key? key,
    this.hintText,
    required TextEditingController controller,
    this.isObscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
  })  : _controller = controller,
        super(key: key);

  final String? hintText;
  final TextEditingController _controller;
  final bool isObscure, readOnly, autofocus;

  final Widget? prefixIcon, suffixIcon;
  final Color? fillColor;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onEditingComplete, onTap;

  @override
  Widget build(BuildContext context, ref) {
    final hideText = useState(true);

    return TextFormField(
      enabled: true,
      controller: _controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      // style: TextStyle(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 14.sp,
      // ),
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: isObscure ? hideText.value : false,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        isDense: fillColor != null ? true : false,
        filled: fillColor != null ? true : false,
        fillColor: fillColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffix: suffixIcon,
        suffixIcon: isObscure
            ? KInkWell(
                onTap: () {
                  hideText.value = !hideText.value;
                },
                child: hideText.value
                    ? const Icon(EvaIcons.eyeOff2Outline)
                    : const Icon(EvaIcons.eye),
              )
            : null,
      ),
    );
  }
}

class KTextFormField2 extends StatelessWidget {
  const KTextFormField2({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Widget? icon;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        fillColor: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
        filled: true,
        suffixIcon: icon,
      ),
      onTap: onTap,
    );
  }
}

class KProfileTextField extends HookConsumerWidget {
  const KProfileTextField({
    Key? key,
    this.hintText,
    TextEditingController? controller,
    this.isObscure = false,
    this.fillColor,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.readOnly = true,
    this.initialValue,
  })  : _controller = controller,
        super(key: key);

  final String? hintText;
  final TextEditingController? _controller;
  final bool isObscure;
  final Color? fillColor;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context, ref) {
    final hideText = useState(true);

    return TextFormField(
      controller: _controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      //textAlign: TextAlign.end,
      style: context.profileSubTitleStyle,
      validator: validator,
      focusNode: focusNode,
      obscureText: isObscure ? hideText.value : false,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      readOnly: readOnly,

      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: readOnly
            ? InputBorder.none
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: context.theme.colorScheme.primary,
                ),
              ),
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 2.h,
        ),
        hintText: hintText,
        hintStyle: context.profileSubTitleStyle,
      ),
    );
  }
}
