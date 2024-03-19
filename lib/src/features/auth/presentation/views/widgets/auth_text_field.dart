import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.label = '',
    this.hint,
    this.textInputType,
  });

  final String label;
  final String? hint;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          keyboardType: textInputType,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            // labelText: 'البريد الالكتروني',
            label: Text(
              label,
            ),
            hintText: hint,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
