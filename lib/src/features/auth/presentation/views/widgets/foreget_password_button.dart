import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //TODO FORGOT PASSWORD SCREEN GOES HERE
      },
      child: Text(
        'نسيت كلمة المرور',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
