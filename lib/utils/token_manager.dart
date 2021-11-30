import 'package:flutter/foundation.dart' show required;
import 'package:trava/models/podos/token.dart';
import 'package:trava/services/storage/storage.dart';

class TravaTokenManager {
  final TravaTokenModel _data = TravaTokenModel(
    accessToken: null,
    createdAt: null,
    email: null,
  );

  static TravaTokenManager? _instance;

  static TravaTokenManager get instance {
    _instance ??= TravaTokenManager();
    return _instance!;
  }

  setToken({
    String? accessToken,
    String? email,
    bool? hasPin,
  }) {
    _data
      ..accessToken = accessToken ?? _data.accessToken
      ..email = email != null || email != "null" ? email! : _data.email
      ..createdAt = DateTime.now();

    LocalStorage.setItems(_data.toJson());
  }

  clearTokens() {
    LocalStorage.removeItems([
      LocalStorage.tokenCreationTime,
      LocalStorage.email,
      LocalStorage.accessToken,
    ]);
    LocalStorage.setItems({
      LocalStorage.isLoggedIn: false,
    });
  }

  Future<TravaTokenModel> get tokens async {
    final createdAt =
        await LocalStorage.getItem(LocalStorage.tokenCreationTime);
    return TravaTokenModel.fromJson({
      "mobileNumber": LocalStorage.getItem(LocalStorage.email),
      "accessToken": LocalStorage.getItem(LocalStorage.accessToken),
      "createdAt": createdAt != null ? DateTime.tryParse(createdAt) : null,
    });
  }

  static updateCreatedAt() {
    LocalStorage.setItem(
      key: LocalStorage.tokenCreationTime,
      value: DateTime.now().toIso8601String(),
    );
  }
}
