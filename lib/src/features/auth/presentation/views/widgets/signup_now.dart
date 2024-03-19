import 'package:flutter/material.dart';

class SignUpNow extends StatelessWidget {
  const SignUpNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'سجل الان',
            textDirection: TextDirection.rtl,
          ),
        ),
        Text(
          'مستخدم جديد؟',
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
