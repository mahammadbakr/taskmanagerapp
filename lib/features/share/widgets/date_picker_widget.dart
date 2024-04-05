import 'package:flutter/material.dart';
import 'package:taskmanagerapp/core/theme.dart';
import 'package:taskmanagerapp/features/share/widgets/text_widget.dart';

class DatePickerWidget extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool? hasPresent;
  final bool? isPresent;
  final String? label;
  final String hint;
  final String? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final Function(DateTime?) onChanged;
  final Function(bool?)? onChangedPresent;
  final Color? fillColor;
  final EdgeInsetsGeometry? margin;
  final bool? enabled;
  final DateTime? initialDate;
  const DatePickerWidget({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.label,
    this.controller,
    this.validator,
    this.padding,
    this.hasPresent,
    this.isPresent,
    this.onChangedPresent,
    this.suffixIcon,
    this.fillColor,
    this.margin,
    this.enabled,
    this.initialDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ?? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: label != null && label != ''
                ? TextWidget(
                    label.toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: padding ?? const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              validator: validator,
              controller: controller,
              initialValue: initialDate != null
                  ? initialDate?.toIso8601String().split('T').first
                  : null,
              readOnly: true,
              enabled: isPresent != true,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor ?? kcWhite,
                focusColor: kcGrey,
                hoverColor: kcLightGrey,
                prefixIconConstraints:
                    const BoxConstraints.tightForFinite(width: 0, height: 0),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: kcMidGray,
                  ),
                ),
                contentPadding: padding ??
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                isDense: true,
                hintText: hint,
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
              onTap: () {
                showDatePicker(
                  context: context,
                  currentDate: DateTime.now(),
                  initialDate: DateTime.now(),
                  locale: const Locale('en'),
                  firstDate: DateTime(DateTime.now().year - 60),
                  lastDate: DateTime(DateTime.now().year + 60),
                ).then(onChanged);
              },
            ),
          ),
        ],
      ),
    );
  }
}
