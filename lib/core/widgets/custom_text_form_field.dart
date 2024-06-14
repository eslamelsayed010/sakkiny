import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.onTap,
    this.obscure = false,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIconPressed,
    this.suffixIcon,
    this.drawBorder = false,
    this.border,
    this.colorText = kLogoColor,
    this.isFilled = true,
    this.isWightThem = false,
    this.cursorColor = kLogoColor,
    this.validatorText,
    this.radius = 10,
    this.contentPadding,
    this.fontSize,
    this.maxLines = 1,
    this.enabled,
    this.hintColor,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool obscure;
  final bool drawBorder;
  final bool isFilled;
  final bool isWightThem;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final void Function()? suffixIconPressed;
  final Color? colorText;
  final Color? cursorColor;
  final String? validatorText;
  final double radius;
  final EdgeInsetsGeometry? contentPadding;
  final double? fontSize;
  final int? maxLines;
  final bool? enabled;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: cursorColor,
      enabled: enabled,
      style: isWightThem ? const TextStyle(color: Colors.black) : null,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      // validator: validator,
      validator: (value) {
        if (value!.isEmpty) {
          return validatorText;
        } else {
          return null;
        }
      },
      onTap: onTap,
      obscureText: obscure,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        filled: isFilled,
        fillColor: Colors.grey[300],
        border: drawBorder
            ? border
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: Colors.black),
              ),
        enabledBorder: drawBorder
            ? border
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: Colors.black),
              ),
        focusedBorder: drawBorder
            ? border
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: Colors.black),
              ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: colorText,
          fontSize: fontSize,
        ),
        hintStyle: TextStyle(
          fontSize: 14,
          color: hintColor,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: kLogoColor,
        suffixIconColor: kLogoColor,
        suffixIcon: suffixIcon != null
            ? TextButton(
                onPressed: suffixIconPressed,
                child: suffixIcon!,
              )
            : null,
      ),
    );
  }
}
