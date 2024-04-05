import 'package:flutter/material.dart';
import 'package:taskmanagerapp/core/theme.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.width,
    this.height,
    this.radius,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.isOutline = false,
    this.borderColor,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool? isOutline;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 55,
      margin: margin ?? const EdgeInsets.all(8),
      child: isOutline == true
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                padding: padding ?? const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(width: 2, color: borderColor ?? kcPrimary),
              ),
              child: Text(
                text,
                style: TextStyle(
                    color: textColor ?? kcPrimary,
                    fontSize: fontSize ?? 14,
                    fontWeight: fontWeight ?? FontWeight.w600),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: padding ?? const EdgeInsets.all(16),
                backgroundColor: backgroundColor ?? kcPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 16),
                  side: BorderSide(
                      color:borderColor?? kcPrimary, width: 0.2, style: BorderStyle.solid),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 14,
                    fontWeight: fontWeight ?? FontWeight.w600),
              ),
            ),
    );
  }
}
