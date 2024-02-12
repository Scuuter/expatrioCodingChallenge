import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String label;
  final String validatorMessage;

  final bool obscureText;

  const TextInputField({
    super.key,
    required this.label,
    required this.validatorMessage,
    this.obscureText = false,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
        ),
        obscureText: widget.obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.validatorMessage;
          }
          return null;
        },
      ),
    );
  }
}
