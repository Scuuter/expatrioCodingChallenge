import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String label;
  final String validatorMessage;

  final bool obscureText;

  final TextEditingController? controller;

  final String? initialValue;

  const TextInputField({
    super.key,
    required this.label,
    required this.validatorMessage,
    this.obscureText = false,
    this.controller,
    this.initialValue,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.label,
          ),
          controller: widget.controller,
          initialValue: widget.initialValue,
          obscureText: widget.obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.validatorMessage;
            }
            return null;
          },
        ),
      ),
    );
  }
}
