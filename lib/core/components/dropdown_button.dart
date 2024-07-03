import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/constants/colors.dart';

class CustomDropdownNew extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  const CustomDropdownNew({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    this.onChanged,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: AppSizeFont.lg,
            fontWeight: FontWeight.bold,
            color: AppColors.greydark,
          ),
        ),
        const SizedBox(height: 12.0),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: label,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            isDense: true, // Reduces the height of the dropdown field
          ),
          focusNode: focusNode,
        ),
      ],
    );
  }
}
