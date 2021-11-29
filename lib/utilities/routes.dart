import 'package:flutter/material.dart';
import 'package:trava/navigation.dart';
import 'package:trava/screens/forget_password_screen/forget_password_screen.dart';
import 'package:trava/screens/forget_password_screen/new_password_screen.dart';
import 'package:trava/screens/forget_password_screen/reset_code_screen.dart';
import 'package:trava/screens/home_screen/fund_wallet_screen/fund_wallet_screen.dart';
import 'package:trava/screens/home_screen/notifications_screen/notifications_screen.dart';
import 'package:trava/screens/home_screen/request_to_deliver_screen/request_to_deliver_screen.dart';
import 'package:trava/screens/home_screen/send_packages_screen/send_packages_screen.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/withdrawal_screen.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/screens/sign_up_screen/sign_up_screen.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  NewPasswordScreen.routeName: (context) => const NewPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ResetCodeScreen.routeName: (context) => const ResetCodeScreen(),
  Navigation.routeName: (context) => const Navigation(),
  FundWalletScreen.routeName: (context) => const FundWalletScreen(),
  WithdrawalScreen.routeName: (context) => const WithdrawalScreen(),
  SendPackagesScreen.routeName: (context) => const SendPackagesScreen(),
  RequestToDeliverScreen.routeName: (context) => const RequestToDeliverScreen(),
  NotificationsScreen.routeName: (context) => const NotificationsScreen(),
};
