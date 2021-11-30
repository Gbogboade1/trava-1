import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trava/screens/login_screen/login_screen.dart';
import 'package:trava/utils/token_manager.dart';

import '../../navigation.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer? timer;

  @override
  void initState() {
    super.initState();
    _routingHandler(context);
  }

  @override
  void dispose() {
    super.dispose();
    if (timer?.isActive ?? false) {
      timer!.cancel();
    }
  }

  void _routingHandler(BuildContext context) {
    timer = Timer(const Duration(milliseconds: 1400), () async {
      final model = await isLoggedIn();
      Navigator.of(context).pushNamedAndRemoveUntil(
        model ? Navigation.routeName : LoginScreen.routeName,
        (_) => false,
      );
    });
  }

  Future<bool> isLoggedIn() async {
    TravaTokenManager _tokenManager = TravaTokenManager.instance;
    var tokens = await _tokenManager.tokens;
    return tokens.accessToken != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Center(
        child: Text(
          "TRAVA",
        ),
      ),
    );
  }
}
