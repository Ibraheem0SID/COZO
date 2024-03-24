import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  AuthTextField({
    super.key,
    this.label = '',
    this.hint,
    this.textInputType,
    this.addObscure = false,
  });

  final String label;
  final String? hint;
  final TextInputType? textInputType;
  final bool addObscure;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          keyboardType: widget.textInputType,
          obscureText: isTextVisible ? true : false,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            suffixIcon: widget.addObscure
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isTextVisible = !isTextVisible;
                      });
                    },
                    child: Icon(!isTextVisible
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash_fill))
                : null,
            alignLabelWithHint: true,
            border: const OutlineInputBorder(),
            label: Text(
              widget.label,
            ),
            hintText: widget.hint,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
