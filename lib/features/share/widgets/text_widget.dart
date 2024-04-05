import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:taskmanagerapp/core/theme.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool enableAutoSize;
  final bool enableGradient;
  final double? height;
  const TextWidget(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.decoration,
    this.maxLines,
    this.enableAutoSize = false,
    this.enableGradient = false,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      color: color ?? kcBlack,
      fontSize: fontSize,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
    );
    if (enableAutoSize) {
      return AutoSizeText(
        text,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
        style: style,
        textAlign: textAlign,
      );
    }
    return Text(
      text,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: style,
      textAlign: textAlign,
    );
  }
}
