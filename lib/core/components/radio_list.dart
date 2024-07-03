import 'package:flutter/material.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String title;
  final TextStyle? textStyle;
  final Color? activeColor;
  final Color? tileColor;
  final EdgeInsetsGeometry? contentPadding;

  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.textStyle,
    this.activeColor,
    this.tileColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: textStyle,
      ),
      activeColor: activeColor,
      tileColor: tileColor,
      contentPadding: contentPadding,
    );
  }
}
