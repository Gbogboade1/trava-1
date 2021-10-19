import 'package:flutter/material.dart';
import 'package:trava/screens/forget_password_screen/forget_password_screen.dart';
import 'package:trava/screens/forget_password_screen/reset_code_screen.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/screens/sign_up_screen/sign_up_screen.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ResetCodeScreen.routeName: (context) => const ResetCodeScreen(),
};
