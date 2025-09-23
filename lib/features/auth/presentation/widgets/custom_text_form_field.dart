import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final String? Function(String?)? validator;
  final IconData? prefixicon;
  final IconData? suffixIcon;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.onFieldSubmitted,
    this.onChanged,
    this.style,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.label,
    this.hint,
    this.errorMessage,
    this.prefixicon,
    this.suffixIcon,
    this.fillColor,
    this.hintStyle, 
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    const borderRadius = Radius.circular(15);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: borderRadius,
              bottomLeft: borderRadius,
              bottomRight: borderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: .06),
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ]),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border.copyWith(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedErrorBorder: border.copyWith(
                borderSide: BorderSide(color: Colors.transparent)),
            isDense: true,
            label: label != null ? Text(label!) : null,
            hintText: hint,
            hintStyle: hintStyle,
            fillColor: fillColor,
            errorText: errorMessage,
            focusColor: colors.primary,
            prefixIcon: Icon(prefixicon),
            suffixIcon: Icon(suffixIcon)),
      ),
    );
  }
}
