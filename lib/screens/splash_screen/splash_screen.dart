import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Center(
        child: Text("TRAVA",),
      ),
    );
  }
}
