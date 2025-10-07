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
  final int? maxLines;
  final int? minLines;
  final Color? textColor;

  const CustomTextFormField({
    Key? key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onFieldSubmitted,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.style,
    this.validator,
    this.prefixicon,
    this.suffixIcon,
    this.fillColor,
    this.hintStyle,
    this.controller,
    this.maxLines,
    this.minLines,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    const borderRadius = Radius.circular(15);

    return Container(
      decoration: BoxDecoration(
          color: fillColor ?? theme.inputDecorationTheme.fillColor,
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
        maxLines: obscureText ? 1 : maxLines,
        minLines: obscureText ? 1 : minLines,
        style: style ?? 
        theme.textTheme.bodyLarge?.copyWith(color: textColor ?? theme.textTheme.bodyLarge?.color),
        // style: TextStyle(
        //     color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          // // floatingLabelStyle: TextStyle(
          // //     color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
          // // enabledBorder: border,
          // // focusedBorder: border,
          // // errorBorder: border.copyWith(
          // //     borderSide: BorderSide(color: Colors.transparent)),
          // // focusedErrorBorder: border.copyWith(
          // //     borderSide: BorderSide(color: Colors.transparent)),
          // isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,
          hintStyle: hintStyle,
          fillColor: fillColor,
          errorText: errorMessage,
          // focusColor: colors.primary,
          prefixIcon: Icon(prefixicon),
          suffixIcon: Icon(suffixIcon),
        ),
      ),
    );
  }
}
