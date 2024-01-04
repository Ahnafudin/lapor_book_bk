import 'package:flutter/material.dart';
import 'styles.dart';

class InputLayout extends StatelessWidget {
  final String label;
  final Widget inputField; // Change to Widget for more flexibility

  const InputLayout(this.label, this.inputField, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: headerStyle(level: 3)),
        const SizedBox(height: 5),
        inputField, // Directly using inputField
        const SizedBox(height: 15),
      ],
    );
  }
}

InputDecoration customInputDecoration(String hintText, {Widget? suffixIcon}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: suffixIcon,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );
}
