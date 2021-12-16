import 'dart:async';
import 'package:trava/state/profile/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trava/state/splash/splash_state.dart';
import 'package:trava/utils/scroll_behaviour.dart';
import 'package:trava/utils/token_manager.dart';

import '../utils/locator.dart';

class StateWrapper extends StatefulWidget {
  final Widget child;

  StateWrapper({
    required this.child,
    bool isMock = true,
  });

  @override
  _StateWrapperState createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper> {
  GlobalKey<NavigatorState> _dignityFinanceNavKey =
      GlobalKey(debugLabel: "navGenerale");
  TravaTokenManager _tokenManager = TravaTokenManager.instance;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthState.instance,
          lazy: true,
        ),
      ],
      child: ScrollConfiguration(
        behavior: TravaScrollAttitude(),
        child: widget.child,
      ),
    );
  }
}
