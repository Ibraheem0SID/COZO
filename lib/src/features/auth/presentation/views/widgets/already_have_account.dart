import 'package:cozo/src/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRouter.login);
          },
          child: const Text(
            'تسجيل الدخول',
            textDirection: TextDirection.rtl,
          ),
        ),
        const Text(
          'لديك حساب بالفعل؟',
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
