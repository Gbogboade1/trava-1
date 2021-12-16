import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:trava/services/storage/storage.dart';
import 'package:trava/utils/token_manager.dart';

class SplashState extends ChangeNotifier {
  static SplashState? _instance;

  static SplashState get instance {
    _instance ??= SplashState();
    return _instance!;
  }

  bool get isLoggedIn {
    TravaTokenManager _tokenManager = TravaTokenManager.instance;
    var tokens = _tokenManager.tokens;
    return tokens.accessToken != null;
  }

  bool get isFirstTimeUser {
    return LocalStorage.isFirstTimeUser;
  }
}
