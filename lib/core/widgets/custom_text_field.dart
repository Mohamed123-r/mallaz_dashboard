import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.title,
    this.validator,
    this.hintTextColor = AppColors.lightModeGrayText,
    this.cursorColor = AppColors.lightModeGrayText,
    this.suffixIconColor = AppColors.lightModeText,
    this.readOnly = false,
  });

  final bool? readOnly;
  final String? title;
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Color hintTextColor;
  final Color cursorColor;
  final Color suffixIconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title!, style: AppTextStyles.subtitle16pxRegular(context)),
        if (title != null) const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          cursorColor: cursorColor,
          onChanged: onChanged,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return '${S.of(context).requiredField}';
                }
                return null;
              },
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.text12pxLight(
              context,
            ).copyWith(color: hintTextColor),
            suffixIcon:
                suffixIcon != null
                    ? IconTheme(
                      data: IconThemeData(color: suffixIconColor),
                      child: suffixIcon!,
                    )
                    : null,
            border: _buildOutlineInputBorder(),
            enabledBorder: _buildOutlineInputBorder(),
            focusedBorder: _focusedOutlineInputBorder(),
            disabledBorder: _buildOutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: AppColors.graysGray4),
    );
  }

  OutlineInputBorder _focusedOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: AppColors.graysGray4),
    );
  }
}
