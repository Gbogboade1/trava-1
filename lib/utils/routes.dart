import 'package:flutter/material.dart';
import 'package:trava/models/https/request/pick_a_package_response.dart';
import 'package:trava/models/https/users/otp_response.dart';
import 'package:trava/navigation.dart';
import 'package:trava/screens/forget_password_screen/forget_password_screen.dart';
import 'package:trava/screens/forget_password_screen/new_password_screen.dart';
import 'package:trava/screens/forget_password_screen/reset_code_screen.dart';
import 'package:trava/screens/history_screen/components/delivered_package_details_screen.dart';
import 'package:trava/screens/history_screen/components/sent_package_details_screen.dart';
import 'package:trava/screens/history_screen/components/to_be_delivered_package_details_screen.dart';
import 'package:trava/screens/history_screen/components/track_package_screen.dart';
import 'package:trava/screens/home_screen/fund_wallet_screen/fund_wallet_screen.dart';
import 'package:trava/screens/home_screen/notifications_screen/notifications_screen.dart';
import 'package:trava/screens/home_screen/request_to_deliver_screen/components/package_available_for_delivery.dart';
import 'package:trava/screens/home_screen/request_to_deliver_screen/request_to_deliver_screen.dart';
import 'package:trava/screens/home_screen/send_packages_screen/send_packages_screen.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/withdrawal_screen.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/screens/manage_hub_screen/manage_hub_screen.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/picked_up_screen/pickedup_screen.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_delivery_screen/verify_delivery_screen.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/component/verify_pickup_screen/verify_pickup_screen.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_delivery_screen/inventory_delivery_screen.dart';
import 'package:trava/screens/more_screen/components/inventory/inventory_drop_off_screen/inventory_drop_off_screen.dart';
import 'package:trava/screens/more_screen/components/packages_to_pickup_screen.dart';
import 'package:trava/screens/onboarding_screen/onboarding_screen.dart';
import 'package:trava/screens/register_hub_screen/register_hub_screen.dart';
import 'package:trava/screens/sign_up_screen/sign_up_screen.dart';
import 'package:trava/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  Navigation.routeName: (context) => const Navigation(),
  FundWalletScreen.routeName: (context) => FundWalletScreen(),
  WithdrawalScreen.routeName: (context) => const WithdrawalScreen(),
  SendPackagesScreen.routeName: (context) => SendPackagesScreen(),
  RequestToDeliverScreen.routeName: (context) => RequestToDeliverScreen(),
  NotificationsScreen.routeName: (context) => const NotificationsScreen(),
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  PackagesToPickUpScreen.routeName: (context) => const PackagesToPickUpScreen(),
  RegisterHubScreen.routeName: (context) => RegisterHubScreen(),
  ManageHubScreen.routeName: (context) => ManageHubScreen(),
  InventoryDeliveryScreen.routeName: (context) =>
      const InventoryDeliveryScreen(),
  InventoryDropOffScreen.routeName: (context) => const InventoryDropOffScreen(),
  PackagesAvailableForDeliveryScreen.routeName: (context) =>
      const PackagesAvailableForDeliveryScreen()
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
    case TrackPackageScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return TrackPackageScreen(settings.arguments as Data);
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
          return SentPackageDetailsScreen(settings.arguments as Data);
        },
      );
    case ToBeDeliveredPackageDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return ToBeDeliveredPackageDetailsScreen(settings.arguments as Data);
        },
      );
//
    case DeliveredPackageDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return DeliveredPackageDetailsScreen(settings.arguments as Data);
        },
      );
    case VerifyDeliveryScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return VerifyDeliveryScreen(settings.arguments as Data);
        },
      );
    case VerifyPickUpScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return VerifyPickUpScreen(settings.arguments as Data);
        },
      );
    case PickedUpScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return PickedUpScreen(settings.arguments as Data);
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
