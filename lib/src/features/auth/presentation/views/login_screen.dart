import 'package:cozo/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/foreget_password_button.dart';
import 'widgets/logo.dart';
import 'widgets/signup_now.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Logo(),
            const Text(
              'أهلا بك',
              style: Styles.s20w,
            ),
            const Text('سجل دخولك بأحدى الطرق ', style: Styles.s20w),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text('سجل باستخدام بريدك الالكتروني',
                      style: Styles.s20b),
                  const SizedBox(
                    height: 25,
                  ),
                  AuthTextField(
                    hint: '  مثال: abcd@mail.com',
                    textInputType: TextInputType.emailAddress,
                    label: 'البريد الالكتروني',
                  ),
                  AuthTextField(
                    textInputType: TextInputType.text,
                    label: 'كلمة المرور',
                    addObscure: true,
                  ),
                  const ForgetPasswordButton(),
                  AuthButton(
                    label: 'تسجيل الدخول',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text('او'),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  AuthButton(
                    label: 'التسجيل باستخدام فيسبوك',
                    onPressed: () {},
                    iconPath: 'assets/images/facebook.png',
                  ),
                  AuthButton(
                    label: 'التسجيل باستخدام قوقل',
                    onPressed: () {},
                    iconPath: 'assets/images/google.png',
                  ),
                  const SignUpNow(),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
