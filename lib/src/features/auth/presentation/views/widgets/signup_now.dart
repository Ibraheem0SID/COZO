import 'package:cozo/src/core/utils/app_router.dart';
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
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.signUp);
          },
          child: const Text(
            'سجل الان',
            textDirection: TextDirection.rtl,
          ),
        ),
        const Text(
          'مستخدم جديد؟',
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
