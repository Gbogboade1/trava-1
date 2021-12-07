import 'package:flutter/material.dart';
import 'package:trava/models/https/users/otp_response.dart';
import 'package:trava/navigation.dart';
import 'package:trava/screens/forget_password_screen/forget_password_screen.dart';
import 'package:trava/screens/forget_password_screen/new_password_screen.dart';
import 'package:trava/screens/forget_password_screen/reset_code_screen.dart';
import 'package:trava/screens/history_screen/components/delivered_package_details_screen.dart';
import 'package:trava/screens/history_screen/components/sent_package_details_screen.dart';
import 'package:trava/screens/home_screen/fund_wallet_screen/fund_wallet_screen.dart';
import 'package:trava/screens/home_screen/notifications_screen/notifications_screen.dart';
import 'package:trava/screens/home_screen/request_to_deliver_screen/request_to_deliver_screen.dart';
import 'package:trava/screens/home_screen/send_packages_screen/send_packages_screen.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/withdrawal_screen.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/screens/more_screen/components/packages_to_pickup_screen.dart';
import 'package:trava/screens/onboarding_screen/onboarding_screen.dart';
import 'package:trava/screens/sign_up_screen/sign_up_screen.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  Navigation.routeName: (context) => const Navigation(),
  FundWalletScreen.routeName: (context) => const FundWalletScreen(),
  WithdrawalScreen.routeName: (context) => const WithdrawalScreen(),
  SendPackagesScreen.routeName: (context) => const SendPackagesScreen(),
  RequestToDeliverScreen.routeName: (context) => const RequestToDeliverScreen(),
  NotificationsScreen.routeName: (context) => const NotificationsScreen(),
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  PackagesToPickUpScreen.routeName: (context) => const PackagesToPickUpScreen(),
};

Route<dynamic> dynamicRoutes(RouteSettings settings) {
  switch (settings.name) {
    case ResetCodeScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return ResetCodeScreen(settings.arguments as OtpResponse);
        },
      );
    case NewPasswordScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return NewPasswordScreen(settings.arguments as OtpResponse);
        },
      );
    case SentPackageDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return SentPackageDetailsScreen(settings.arguments as List);
        },
      );
    case DeliveredPackageDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return DeliveredPackageDetailsScreen(settings.arguments as List);
        },
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return const SplashScreen();
        },
      );
  }
}
