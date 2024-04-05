import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/features/share/widgets/text_widget.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hint,
    this.initialValue,
    this.icon,
    this.onIconPressed,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.focusNode,
    this.maxLines,
    this.inputFormatters,
    this.enabled,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.label,
    this.subLabel,
    this.fillColor,
  });
  final String? hint;
  final String? initialValue;
  final Widget? icon;
  final VoidCallback? onIconPressed;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final String? label;
  final String? subLabel;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final Widget textForm = TextFormField(
      initialValue: initialValue,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      focusNode: focusNode,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      enabled: enabled ?? true,
      style: const TextStyle(color: kcBlack),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onIconPressed,
                  icon: icon!,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onSuffixIconPressed,
                  icon: suffixIcon!,
                ),
              )
            : null,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        contentPadding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        filled: true,
        fillColor: fillColor ?? kcWhite,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kcGrey, width: 1),
        ),
        enabled: enabled ?? true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kcGrey, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kcGrey, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kcGrey, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kcGrey, width: 1),
        ).copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
    return Container(
      width: width ?? double.infinity,
      height: height,
      margin:
          margin ?? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: label == null || label == ''
          ? textForm
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: subLabel != null && subLabel != ''
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextWidget(
                              '$label ',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            TextWidget(
                              subLabel.toString(),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: kcDarkGray,
                            ),
                          ],
                        )
                      : TextWidget(
                          label.toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                ),
                const SizedBox(
                  height: 6,
                ),
                textForm
              ],
            ),
    );
  }
}
