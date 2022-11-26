import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget.dart';

class KTitledTextFormField extends StatelessWidget {
  const KTitledTextFormField({
    Key? key,
    required this.title,
    required TextEditingController controller,
    FocusNode? focus,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.isObscure = false,
    this.textStyle,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
  })  : _controller = controller,
        _focus = focus,
        super(key: key);

  final String title;
  final TextStyle? textStyle;
  final TextEditingController _controller;
  final FocusNode? _focus;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final Function(String?)? onChanged, onSaved;
  final Function()? onEditingComplete, onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KTitleText(
            title,
            fontColor: textStyle?.color,
            fontSize: textStyle?.fontSize,
            fontWeight: textStyle?.fontWeight,
          ),
          const GapHight(gap: 4),
          KTextFormField(
            controller: _controller,
            focusNode: _focus,
            isObscure: isObscure,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onSaved: onSaved,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
