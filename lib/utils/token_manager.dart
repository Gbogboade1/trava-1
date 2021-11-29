// import 'dart:developer';

// import 'package:cred_agent/services/storage/storage.dart';
// import 'package:flutter/foundation.dart' show required;
// import 'package:cred_agent/models/podos/token.dart';

// class TravaTokenManager {
//   final TravaTokenModel _data = TravaTokenModel(
//     accessToken: null,
//     refreshToken: null,
//     createdAt: null,
//     mobileNumber: null,
//   );

//   static TravaTokenManager? _instance;

//   static TravaTokenManager get instance {
//     if (_instance == null) {
//       _instance = TravaTokenManager();
//     }
//     return _instance!;
//   }

//   setToken({
//     String? accessToken,
//     String? refreshToken,
//     String? mobileNumber,
//     bool? hasPin,
//   }) {
//     _data
//       ..accessToken = accessToken ?? _data.accessToken
//       ..refreshToken = refreshToken ?? _data.refreshToken
//       ..mobileNumber = mobileNumber != null || mobileNumber != "null"
//           ? mobileNumber!
//           : _data.mobileNumber
//       ..createdAt = DateTime.now();

//     LocalStorage.setItem(
//         key: LocalStorage.hasPin,
//         value: hasPin ?? LocalStorage.getItem(LocalStorage.hasPin) ?? false);
//     LocalStorage.setItems(_data.toJson());
//   }

//   clearTokens() {
//     LocalStorage.removeItems([
//       LocalStorage.accessToken,
//       LocalStorage.tokenCreationTime,
//       LocalStorage.refreshToken,
//       LocalStorage.mobileNumber,
//     ]);
//     LocalStorage.setItems({
//       LocalStorage.isLoggedIn: false,
//       LocalStorage.hasPin: false,
//     });
//   }

//   Future<TravaTokenModel> get tokens async {
//     final createdAt = await LocalStorage.getItem(LocalStorage.tokenCreationTime);
//     return TravaTokenModel.fromJson({
//       "mobileNumber": LocalStorage.getItem(LocalStorage.mobileNumber),
//       "accessToken": LocalStorage.getItem(LocalStorage.accessToken),
//       "refreshToken": LocalStorage.getItem(LocalStorage.refreshToken),
//       "createdAt": createdAt != null ? DateTime.tryParse(createdAt) : null,
//     });
//   }

//   static updateCreatedAt() {
//     LocalStorage.setItem(
//       key: LocalStorage.tokenCreationTime,
//       value: DateTime.now().toIso8601String(),
//     );
//   }
// }
