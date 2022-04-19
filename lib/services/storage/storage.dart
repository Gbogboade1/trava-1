import 'dart:async';
import 'package:flutter/foundation.dart' show required, ValueListenable;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static final Box _db = Hive.box("user_data");
  static String isLoggedIn = "isLoggedIn";
  static String firstTimeUser = "firstTimeUser";
  static String userData = "userData";
  static String accessToken = "accessToken";
  static String tokenCreationTime = "createdAt";
  static String email = "email";

  static bool get isFirstTimeUser {
    final db = Hive.box("app_data");
    final data = db.get(firstTimeUser, defaultValue: true);

    return data == true;
  }

  static void markAsExistingUser() {
    final db = Hive.box("app_data");
    db.put(firstTimeUser, false);
  }

  static bool get userIsLoggedIn {
    final data = _db.get(isLoggedIn, defaultValue: false);

    return data == true;
  }

  static FutureOr<bool> removeItem(String key) async {
    try {
      await _db.delete(key);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  static FutureOr<dynamic> getItem(String key, {dynamic defaultValue}) {
    try {
      final value = _db.get(key, defaultValue: defaultValue);
      return value;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  static FutureOr<bool> setItem(
      {required String key, @required dynamic value}) async {
    try {
      await _db.put(key, value);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  static FutureOr<bool> setItems(Map<String, dynamic> data) async {
    try {
      await _db.putAll(data);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  static FutureOr<bool> removeItems(List<String> keys) async {
    try {
      await _db.deleteAll(keys);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  static ValueListenable<Box> get userDataListener {
    return _db.listenable(keys: [userData]);
  }
}
