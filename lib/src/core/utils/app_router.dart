import 'package:cozo/src/features/auth/presentation/views/login_screen.dart';
import 'package:cozo/src/features/auth/presentation/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String forgetPassword = 'forgetPassword';

  static Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => const LoginScreen(),
    signUp: (context) => const SignUpScreen(),
    // forgetPassword: (context) => const ForgetPasswordScreen(),
  };
}
